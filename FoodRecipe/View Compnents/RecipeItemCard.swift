//
//  RecipeItemCard.swift
//  FoodRecipe
//
//  Created by MorsyElsokary on 12/03/2022.
//

import SwiftUI

struct RecipeItemCard: View {
    
    // MARK: - Properties
    
    var recipeimage: String
    var recipeName: String
    var recipeHeadline: String
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            if let imageUrl = URL(string: recipeimage) {
                WebImageView(imageURL: imageUrl)
                    .shadow(color: Color.gray,
                            radius: 6, x: 0, y: 3)
            }

            Text(recipeName)
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .lineLimit(3)
                .minimumScaleFactor(0.5)
            
            Text(recipeHeadline)
                .font(.caption)
                    .foregroundColor(.secondary)
        }
        .padding(.bottom)
        .cornerRadius(10)
        .background(BackgroundFloatingView().offset(y: 5))
        .background(BasicBorderView())
    }
}
