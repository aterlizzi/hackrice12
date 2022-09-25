//
//  HomePageModel.swift
//  hackrice-app
//
//  Created by Kayden Brewer on 9/24/22.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    @EnvironmentObject var locationManager: LocationManager
    @EnvironmentObject var googleAuthVM: GoogleAuthViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.black
                .ignoresSafeArea()
            Spacer()
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    if let name = googleAuthVM.givenName {
                        Text("Hello " + name + ",")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                            .padding(.bottom, 5)
                        Text("Welcome Back!")
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                VStack(alignment: .leading, spacing: 25) {
                    HStack(alignment: .center, spacing: 25) {
                        Button {
                            if let latitude = locationManager.userLocation?.coordinate.latitude,
                               let longitude = locationManager.userLocation?.coordinate.longitude {
                                homePageVM.openNearestDoor(coordinates: [longitude, latitude])
                            }
                        } label: {
                            ZStack {
                                Color.pastelGreen
                                VStack {
                                    Image(systemName: "lock.shield")
                                        .renderingMode(.template)
                                        .foregroundColor(.black)
                                        .padding(.bottom, 5)
                                    
                                    Text("Unlock")
                                        .font(.body)
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .bold()
                                    
                                }
                            }
                            .frame(width: 125, height: 200)
                            .cornerRadius(20)
                        }
                        
                        ZStack {
                            Color.pastelBlue
                            VStack {
                                Image(systemName: "gearshape")
                                    .padding(.bottom, 5)
                                
                                Text("Settings")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .bold()
                                
                            }
                        }
                        .frame(width: 125, height: 200)
                        .cornerRadius(20)
                    }
                    HStack(alignment: .center, spacing: 25) {
                        ZStack {
                            Color.pastelYellow
                            
                            VStack {
                                Image(systemName: "clock")
                                    .padding(.bottom, 5)
                                
                                Text("Historical Data")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .bold()
                                
                            }
                        }
                        .frame(width: 150, height: 200)
                        .cornerRadius(20)
                        
                        Button {
                            googleAuthVM.signOut()
                        } label: {
                            ZStack {
                                Color.pastelGreen
                                VStack {
                                    Image(systemName: "arrowshape.turn.up.left")
                                        .renderingMode(.template)
                                        .foregroundColor(.black)
                                        .padding(.bottom, 5)
                                    
                                    Text("Leave")
                                        .font(.body)
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .bold()
                                    
                                }
                            }
                            .frame(width: 100, height: 200)
                            .cornerRadius(20)
                        }
                    }
                }
                Spacer()
                Spacer()
            }
            .padding(40)
        }
        
        
        
        //        VStack {
        //            ZStack(alignment: .topLeading) {
        //                RoundedRectangle(cornerRadius: 30, style: .continuous).size(CGSize(width: 250, height: 250))
        //
        //                Text("Join")
        //                    .foregroundColor(.white)
        //                    .font(.largeTitle).bold()
        //                    .padding(25)
        //
        //            }
        //            Button {
        //                if let latitude = locationManager.userLocation?.coordinate.latitude,
        //                   let longitude = locationManager.userLocation?.coordinate.longitude {
        //                    homePageVM.openNearestDoor(coordinates: [longitude, latitude])
        //                }
        //            } label: {
        //                ZStack(alignment: .topLeading) {
        //                    RoundedRectangle(cornerRadius: 30, style: .continuous).size(CGSize(width: 250, height: 250))
        //                    Text("Unlock \nNearest \nDoor")
        //                        .foregroundColor(.white)
        //                        .font(.largeTitle).bold()
        //                        .padding(25)
        //                }
        //            }
        //        }
    }
}

struct HomePageModel_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

