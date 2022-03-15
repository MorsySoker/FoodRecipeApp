//
//  AppBackground.swift
//  FoodRecipe
//
//  Created by MorsyElsokary on 15/03/2022.
//

import SwiftUI

struct AppBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.goldenYellow, Color.bloodyRed]), startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct AppBackground_Previews: PreviewProvider {
    static var previews: some View {
        AppBackground()
    }
}
