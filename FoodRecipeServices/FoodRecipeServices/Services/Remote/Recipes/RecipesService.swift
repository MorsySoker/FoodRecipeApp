//
//  RecipesService.swift
//  FoodRecipeServices
//
//  Created by MorsyElsokary on 11/03/2022.
//

import Foundation
import Combine

public protocol RecipesServiceProtocol {
    func getRecipes() -> AnyPublisher<[RecipesModel], NetworkError>
}

public class RecipesService: RecipesServiceProtocol {
    
    // MARK: - Properties
    
    private var networkServices: NetworkServiceProtocol
    
    // MARK: - init
    
    public init(networkServices: NetworkServiceProtocol = NetworkService()) {
        self.networkServices = networkServices
    }
    
    public func getRecipes() -> AnyPublisher<[RecipesModel], NetworkError> {
        let endPoint = RecipesServiceEndpoint.getRecipes
        let request = endPoint.createRequest()
        return networkServices.request(request)
    }
}
