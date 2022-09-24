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
            Color(.systemMint).ignoresSafeArea()
            VStack{
                RoundedRectangle(cornerRadius: 30,style: .circular)
                    .size(CGSize(width: 250, height: 250))
                    .padding (.bottom, 32)
                    .offset(x:70, y:100)
                
                Text("Please share your phone's location to continue")
                    .font(.system(size: 28, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                    
                Text("Start sharing now")
                    .multilineTextAlignment(.center)
                    .frame(width: 140)
                    .padding()
                
                Spacer()
                
                VStack{
                    Button {
                        LocationManager.shared.requestLocation()
                    } label: {
                        Text("Allow location")
                            .padding()
                            .font(.headline)
                            .foregroundColor(Color(.systemMint))
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.horizontal, -32)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding()
                    
                    Button{
                        print("Dismiss")
                    } label: {
                        Text("Maybe later")
                            .padding()
                            .font(.headline)
                            .foregroundColor(.white)
    
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
