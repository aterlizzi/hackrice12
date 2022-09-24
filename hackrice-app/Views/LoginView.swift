//
//  LoginView.swift
//  hackrice-app
//
//  Created by Aidan Terlizzi on 9/23/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var googleVM: GoogleAuthViewModel
    
    fileprivate func SignInButton() -> Button<Text> {
           Button(action: {
               googleVM.signIn()
           }) {
               Text("Sign In")
           }
       }
    
    var body: some View {
        VStack {
            if(googleVM.isLoggedIn) {
                Text("You are logged in")
            } else {
                SignInButton()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
