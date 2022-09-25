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
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 30, style: .continuous).size(CGSize(width: 250, height: 250))
                
                Text("Join")
                    .foregroundColor(.white)
                    .font(.largeTitle).bold()
                    .padding(25)
                
            }
            Button {
                if let latitude = locationManager.userLocation?.coordinate.latitude,
                   let longitude = locationManager.userLocation?.coordinate.longitude {
                    homePageVM.openNearestDoor(coordinates: [longitude, latitude])
                }
            } label: {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 30, style: .continuous).size(CGSize(width: 250, height: 250))
                    Text("Unlock \nNearest \nDoor")
                        .foregroundColor(.white)
                        .font(.largeTitle).bold()
                        .padding(25)
                }
            }
        }
    }
}

struct HomePageModel_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

