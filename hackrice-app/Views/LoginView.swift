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
    
    func fetchData() async {
//        establish url
        guard let url = URL(string: "http://localhost:5000") else {
            print("Failed to fetch login...")
            return
        }
        
//        fetch data from url
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
//            decode the data
            if let decodedResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) {
                response = decodedResponse
            }
        } catch {
            print("Failed to decode data, invalid format.")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(response: LoginResponse(status: .success, message: "Successful logged in"))
    }
}
