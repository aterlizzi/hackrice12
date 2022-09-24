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

    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView()
            }
            .environmentObject(googleAuthUser)
            .navigationViewStyle(.stack)
        }
    }
}
