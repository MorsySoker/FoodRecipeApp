//
//  RecipesServiceEndpoint.swift
//  FoodRecipeServices
//
//  Created by MorsyElsokary on 11/03/2022.
//

import Foundation

enum RecipesServiceEndpoint {
    
    case getRecipes
    
    var requestTimeOut: Int {
        return 20
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getRecipes: return .GET
        }
    }
    
    func createRequest(token: String? = nil) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"] = "application/json"
        if let token = token {
            headers["Authorization"] = "Bearer \(token)"
        }
        return NetworkRequest(
            url: getURL(), headers: headers, requestBody: requestBody, httpMethod: httpMethod)
    }
    
    var requestBody: Encodable? {
        switch self {
        default:
            return nil
        }
    }
    
    func getURL() -> String {
        switch self {
        case .getRecipes:
            return Enviroment.baseURL
        }
    }
}
