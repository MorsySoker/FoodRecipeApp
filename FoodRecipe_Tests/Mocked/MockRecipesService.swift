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
                promise(.success(self.recipes))
            }
        }
        .eraseToAnyPublisher()
    }
}
