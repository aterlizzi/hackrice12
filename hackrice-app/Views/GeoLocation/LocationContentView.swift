//
//  LocationContentView.swift
//  hackrice-app
//
//  Created by Kayden Brewer on 9/24/22.
//

import SwiftUI

struct LocationRequestView: View {
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Text("Please share your phone's location to continue")
                    .font(.system(size: 28, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                    
                Text("We use your location to locate the correct door, saving you countless time.")
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                VStack{
                    Button {
                        LocationManager.shared.requestLocation()
                    } label: {
                        Text("Allow location")
                            .padding()
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.horizontal, -32)
                    .background(Color.black)
                    .clipShape(Capsule())
                    .padding()
                    
                    Button{
                        print("Dismiss")
                    } label: {
                        Text("Maybe later")
                            .padding()
                            .font(.headline)
                            .foregroundColor(.black)
    
                    }
                    
                }
            }
        }
    }
}

struct LocationContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationRequestView()
    }
}
