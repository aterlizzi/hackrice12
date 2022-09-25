//
//  LocationRequestView.swift
//  hackrice-app
//
//  Created by Kayden Brewer on 9/24/22.
//

import SwiftUI

struct LocationContentView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        Group{
            if locationManager.userLocation == nil {
                LocationRequestView()
            } else if let location = locationManager.userLocation {
                Text("\(location)")
                    .padding()
            }
        }
    }
}

struct LocationRequestView_Previews: PreviewProvider {
    static var previews: some View {
        LocationContentView()
    }
}
