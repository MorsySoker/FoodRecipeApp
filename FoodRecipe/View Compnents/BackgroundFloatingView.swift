//
//  BackgroundFloatingView.swift
//  LeadScrm
//
//  Created by MorsyElsokary on 27/01/2022.
//

import SwiftUI

struct BackgroundFloatingView: View {
    
    // MARK: - Properties
    
    var radius: CGFloat = 5
    var radius2: CGFloat = 10
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.white
                .cornerRadius(radius)
                .shadow(color: Color.dropShadow,
                        radius: 6, x: 0, y: 3)
                
            RoundedRectangle(cornerRadius: radius2)
                .offset(x: 0, y: -3)
                .foregroundColor(Color.white)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct FloatingViewToBeOverlayed_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundFloatingView()
            .padding()
    }
}
