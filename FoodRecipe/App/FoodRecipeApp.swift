//
//  FoodRecipeApp.swift
//  FoodRecipe
//
//  Created by MorsyElsokary on 10/03/2022.
//

import SwiftUI

@main
struct FoodRecipeApp: App {
    
    // MARK: - Properties
    
    @StateObject var foodRecipesVM = FoodRecipesViewModel()
    
    // MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            LoginView()
//            HomeView()
//                .environmentObject(foodRecipesVM)
        }
    }
}
