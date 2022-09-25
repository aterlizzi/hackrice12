//
//  SplashView.swift
//  hackrice-app
//
//  Created by Aidan Terlizzi on 9/25/22.
//

import SwiftUI

struct SplashView: View {
    
    var animationType: SplashShape.SplashAnimation
    @State private var prevColor: Color // Stores background color
    @State var layers: [(Color,CGFloat)] = [] // New Color & Progress
    @ObservedObject var colorStore: ColorStore // Send new color updates


    
    init(animationType: SplashShape.SplashAnimation, color: Color) {
        self.animationType = animationType
        self._prevColor = State<Color>(initialValue: color)
        self.colorStore = ColorStore(color: color)
    }

    var body: some View {
        Rectangle()
            .foregroundColor(self.prevColor)
            .overlay(
                ZStack {
                    ForEach(layers.indices, id: \.self) { x in
                        SplashShape(progress: self.layers[x].1, animationType: self.animationType)
                            .foregroundColor(self.layers[x].0)
                    }

                }

                , alignment: .leading)
            .onReceive(self.colorStore.$color) { color in
                // Animate color update here
                self.layers.append((color, 0))

                withAnimation(.easeInOut(duration: 0.5)) {
                    self.layers[self.layers.count-1].1 = 1.0
                }
            }
    }

}

class ColorStore: ObservableObject {
    @Published var color: Color
    
    init(color: Color) {
        self.color = color
    }
}
