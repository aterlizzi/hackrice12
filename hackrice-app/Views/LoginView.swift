//
//  LoginView.swift
//  hackrice-app
//
//  Created by Aidan Terlizzi on 9/23/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var googleVM: GoogleAuthViewModel
    
    var body: some View {
        VStack {
            if(googleVM.isLoggedIn) {
                Button {
                    googleVM.signOut()
                } label: {
                    Text("Sign Out")
                        .foregroundColor(.black)
                        .padding(30)
                }
            } else {
                Button {
                    googleVM.signIn()
                } label: {
                    Text("Sign In")
                        .foregroundColor(.black)
                        .padding(30)
                }
            }
        }
    }
}
