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
    @ObservedObject var locationManager = LocationManager.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                if googleAuthUser.isLoggedIn && locationManager.userLocation != nil {
                    HomePage()
                        .environmentObject(homePage)
                        .environmentObject(locationManager)
                        .environmentObject(googleAuthUser)
                } else if (googleAuthUser.isLoggedIn && locationManager.userLocation == nil) {
                    LocationContentView()
                        .environmentObject(locationManager)
                } else {
                    LoginView()
                        .environmentObject(googleAuthUser)
                }
            }
            .navigationViewStyle(.stack)
        }
    }
}
