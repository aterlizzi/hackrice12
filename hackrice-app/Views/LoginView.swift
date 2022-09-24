//
//  LoginView.swift
//  hackrice-app
//
//  Created by Aidan Terlizzi on 9/23/22.
//

import SwiftUI

struct LoginView: View {
    @State var response: LoginResponse
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(response: LoginResponse(status: .success, message: "Successful logged in"))
    }
}
