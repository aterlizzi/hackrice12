//
//  HomePageModel.swift
//  hackrice-app
//
//  Created by Kayden Brewer on 9/24/22.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    
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
                homePageVM.openNearestDoor(coordinates: [-95.40202666671637, 29.71786358463996])
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

