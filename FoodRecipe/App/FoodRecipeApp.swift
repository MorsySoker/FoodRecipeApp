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
    @StateObject var loginVM = LoginViewModel()
    @StateObject var appState = AppState()
    
    // MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            switch appState.currentRoot {
            case .lunching:
                SplashView()
                    .environmentObject(appState)
            case .authentication:
                LoginView()
                    .environmentObject(appState)
                    .environmentObject(loginVM)
                
            case .home:
                HomeView()
                    .environmentObject(appState)
                    .environmentObject(foodRecipesVM)
            }
        }
    }
}
