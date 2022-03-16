//
//  AppBtnLabel.swift
//
//  Created by MorsyElsokary on 03/03/2022.
//

import SwiftUI

struct AppBtnLabel: View {
    // MARK: - Properties
    
    var text: String
    var isLoading: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 5) {
            Text(text)
                .font(.poppinsSemiBold(15))
                .foregroundColor(.white)
            
            if isLoading {
            LoadingCircle(width: 10,
                          height: 10,
                          trimTo: 0.7,
                          color: .white)
            }
        }
        .animation(Animation.easeIn, value: isLoading)
        .frame(width: 154, height: 44)
        .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.goldenYellow))
        .shadow(color: Color.dropShadow,
                radius: 6, x: 0, y: 3)
    }
}

struct AppBtnLabel_Previews: PreviewProvider {
    static var previews: some View {
        AppBtnLabel(text: "Hello")
    }
}
