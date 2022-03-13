//
//  FoodRecipesView.swift
//  FoodRecipe
//
//  Created by MorsyElsokary on 12/03/2022.
//

import SwiftUI
import FoodRecipeServices

struct FoodRecipesView: View {
    
    // MARK: - Properties
    
    var foodRecipes: [RecipesModel] = []
    @Binding var selectedRecipe: RecipesModel?
    var onPress: () -> () = {}
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(foodRecipes) { recipe in
                    Button(action: {
                        selectedRecipe = recipe
                        onPress() }) {
                        RecipeItemCard(recipeimage: recipe.image, recipeName: recipe.name, recipeHeadline: recipe.headline)
                    }
                }
            }.padding()
        }
    }
}
