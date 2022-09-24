//
//  GoogleLoginViewModel.swift
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
    
    init(){
        check()
    }
    
    func checkStatus(){
        if(GIDSignIn.sharedInstance.currentUser != nil){
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else { return }
            let givenName = user.profile?.givenName
            let profilePicUrl = user.profile!.imageURL(withDimension: 100)!.absoluteString
            self.givenName = givenName ?? ""
            self.profilePicUrl = profilePicUrl
            self.isLoggedIn = true
        } else{
            self.isLoggedIn = false
            self.givenName = "Not Logged In"
            self.profilePicUrl =  ""
        }
    }
    
    func check(){
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error = error {
                self.errorMessage = "error: \(error.localizedDescription)"
            }
            
            self.checkStatus()
        }
    }
    
    func signIn(){
        
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        let signInConfig = GIDConfiguration.init(clientID: "CLIENT-ID")
        GIDSignIn.sharedInstance.signIn(
            with: signInConfig,
            presenting: presentingViewController) { user, error in
                if let error = error {
                    self.errorMessage = "error: \(error.localizedDescription)"
                }
                self.checkStatus()
            }
    }
    
    func signOut(){
        GIDSignIn.sharedInstance.signOut()
        self.checkStatus()
    }
}

//func fetchData() async {
////        establish url
//    guard let url = URL(string: "http://localhost:5000") else {
//        print("Failed to fetch login...")
//        return
//    }
//
////        fetch data from url
//    do {
//        let (data, _) = try await URLSession.shared.data(from: url)
//
////            decode the data
//        if let decodedResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) {
//            response = decodedResponse
//        }
//    } catch {
//        print("Failed to decode data, invalid format.")
//    }
//}
