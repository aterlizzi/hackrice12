//
//  GoogleAuthViewModel.swift
//  hackrice-app
//
//  Created by Aidan Terlizzi on 9/23/22.
//

import Foundation
import SwiftUI
import GoogleSignIn

class GoogleAuthViewModel: ObservableObject {
    
    @Published var givenName: String = ""
    @Published var profilePicUrl: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    @Published var isntPartOfOrg: Bool = false
    @Published var emailAddress: String = ""
    
    init(){
        check()
    }
    
    
    
    func checkStatus() {
        if(GIDSignIn.sharedInstance.currentUser != nil){
//            if the user successfully logged in via googles standards, make an api call for backend to                process the user for org details.
            let status = verifyGoogleUser()
            
//            if user isn't part of the organization, sign them out and give them an error.
            if (!status) {
                GIDSignIn.sharedInstance.signOut()
                self.isntPartOfOrg = true
                return
            }
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else { return }
            let givenName = user.profile?.givenName
            let emailAddress = user.profile?.email
            let profilePicUrl = user.profile!.imageURL(withDimension: 100)!.absoluteString
            self.givenName = givenName ?? ""
            self.emailAddress = emailAddress ?? ""
            self.profilePicUrl = profilePicUrl
            self.isLoggedIn = true
        } else{
            self.isLoggedIn = false
            self.givenName = "Not Logged In"
            self.profilePicUrl =  ""
        }
    }
    
    func check() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                if let error = error {
                    self.errorMessage = "error: \(error.localizedDescription)"
                }
                
                self.checkStatus()
            }
    }
    
    func signIn() {
        
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        let signInConfig = GIDConfiguration.init(clientID: "881190902094-mokf60mqsqohtl15e4oko8vat5v66onk.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(
            with: signInConfig,
            presenting: presentingViewController) { user, error in
                if let error = error {
                    self.errorMessage = "error: \(error.localizedDescription)"
                }
                self.checkStatus()
            }
    }
    
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        self.checkStatus()
    }
    
    func verifyGoogleUser() ->  Bool {
        guard let url = URL(string: "http://localhost:3000/login/verify") else {
            GIDSignIn.sharedInstance.signOut()
            return false
        }
            checkData(url: url) { isSuccess in
                if isSuccess {return true}
                return false
            }
        return true
    }
    
    func checkData(url: URL, completion: @escaping (_ isSuccess: Bool) -> Bool) {
        var request = URLRequest(url: url)
        
//      create the post request
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = [
            "email": emailAddress
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
         let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) {
                    if decodedResponse.status.rawValue == "success" {
                        completion(true)
                    } else {
                        GIDSignIn.sharedInstance.signOut()
                        completion(false)
                    }
                }
            }
        }
        task.resume()
    }
}
