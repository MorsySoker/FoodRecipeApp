//
//  BasicBorderView.swift
//  LeadScrm
//
//  Created by MorsyElsokary on 19/02/2022.
//

import SwiftUI

struct BasicBorderView: View {
    
    // MARK: - Properties
    
    var color: Color = .gray
    var radius: CGFloat = 20
    
    // MARK: - Body
    
    var body: some View {
        RoundedRectangle(cornerRadius: radius)
            .stroke(color, lineWidth: 1)
    }
}

struct BasicBorderView_Previews: PreviewProvider {
    static var previews: some View {
        BasicBorderView(color: .white)
    }
}
