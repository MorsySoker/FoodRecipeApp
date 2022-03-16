//
//  LoadingCircle.swift
//  Leedo
//
//  Created by MorsyElsokary on 03/03/2022.
//

import SwiftUI

//MARK: Loading Circle
struct LoadingCircle: View {
    
    @State private var isLoading = false
    var width: CGFloat
    var height: CGFloat
    var trimTo: CGFloat
    var color: Color
    
    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0, to: trimTo)
                .stroke(color, lineWidth: 2)
                .frame(width: width, height: height)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
                .onAppear {
                    self.isLoading.toggle()
                }
        }
    }
}

struct LoadingCircle_Previews: PreviewProvider {
    static var previews: some View {
        LoadingCircle(width: 25, height: 25, trimTo: 0.6, color: .green)
    }
}
