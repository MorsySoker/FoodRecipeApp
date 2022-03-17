//
//  HomeView.swift
//  FoodRecipe
//
//  Created by MorsyElsokary on 11/03/2022.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var foodRecipesVM: FoodRecipesViewModel
    @State private var isDetailedViewPresented: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            AppBackground()
            
            recipeList
                .sheet(isPresented: $isDetailedViewPresented) {
                    if let foodRecipe = foodRecipesVM.selectedRecipe {
                        FoodRecipeDetailedView(foodRecipe: foodRecipe)
                    }
                }
        }
    }
}

private extension HomeView {
    var recipeList: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(foodRecipesVM.recipes) { recipe in
                    Button(action: {
                        foodRecipesVM.selectedRecipe = recipe
                        isDetailedViewPresented.toggle() }) {
                            RecipeItemCard(recipeimage: recipe.image,
                                           recipeName: recipe.name,
                                           recipeHeadline: recipe.headline)
                        }
                }
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
