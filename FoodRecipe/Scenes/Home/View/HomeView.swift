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
        FoodRecipesView(foodRecipes: foodRecipesVM.recipes, selectedRecipe: $foodRecipesVM.selectedRecipe) {
            isDetailedViewPresented.toggle()
        }
        .sheet(isPresented: $isDetailedViewPresented) {
            if let foodRecipe = foodRecipesVM.selectedRecipe {
            FoodRecipeDetailedView(foodRecipe: foodRecipe)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
