//
//  MockRecipesService.swift
//  FoodRecipe_Tests
//
//  Created by MorsyElsokary on 16/03/2022.
//

import Foundation
import FoodRecipeServices
import Combine

class MockRecipesService: RecipesServiceProtocol {
    let mockRecipes = [RecipesModel(id: "1", fats: "58", name: "Fun", time: "12:10", image: "", carbos: "", fibers: "", rating: 1.0, ratings: 1, calories: "", headline: "", proteins: "", difficulty: 1, welcomeDescription: "", highlighted: true, ingredients: ["", "", ""]), RecipesModel(id: "2", fats: "70", name: "Funk", time: "12:10", image: "", carbos: "", fibers: "", rating: 1.0, ratings: 1, calories: "", headline: "", proteins: "", difficulty: 1, welcomeDescription: "", highlighted: true, ingredients: ["", "", ""]) ]
    
    var recipes: [RecipesModel]
    
    init(recipes: [RecipesModel]) {
        self.recipes = recipes
    }
    
   public func getRecipes() -> AnyPublisher<[RecipesModel], NetworkError> {
        Future<[RecipesModel], NetworkError> { [weak self] promise in
            guard let self = self else {return}
            if self.recipes.isEmpty {
                promise(.failure(NetworkError.noResponse("no responce")))
            }
            else {
                promise(.success(self.mockRecipes))
            }
        }
        .eraseToAnyPublisher()
    }
}
