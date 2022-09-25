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
        VStack(alignment: .center) {
            Spacer()
            Text("GeograKey")
                .font(.title)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .fontWeight(.heavy)
                .padding(.bottom, 10)
            Text("A step forward towards a safer place with our autonomous doors. Secure your future with us.")
                .font(.callout)
                .padding(.bottom, 50)
                .multilineTextAlignment(.center)
            if(!googleVM.isLoggedIn) {
                Button {
                    googleVM.signIn()
                } label: {
                    VStack {
                        Text("Redefine Your Safety")
                            .foregroundColor(.white)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 100)
                    }
                    .background(.black)
                    .cornerRadius(6)
                }
            }
            if(googleVM.isntPartOfOrg) {
                Text("You aren't authorized on this domain.")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
            Spacer()
        }

    }
}
