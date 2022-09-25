//
//  hackrice_appApp.swift
//  hackrice-app
//
//  Created by Aidan Terlizzi on 9/23/22.
//

import SwiftUI

@main
struct hackrice_appApp: App {
    @ObservedObject var googleAuthUser = GoogleAuthViewModel()
    @ObservedObject var homePage = HomePageViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                if googleAuthUser.isLoggedIn {
//                    HomePage()
//                        .environmentObject(homePage)
                    LocationContentView()
                } else {
                    LoginView()
                        .environmentObject(googleAuthUser)
                }
            }
            .navigationViewStyle(.stack)
        }
    }
}
