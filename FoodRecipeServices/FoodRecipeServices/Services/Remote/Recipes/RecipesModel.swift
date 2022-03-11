//
//  RecipesModel.swift
//  FoodRecipeServices
//
//  Created by MorsyElsokary on 11/03/2022.
//

import Foundation

// MARK: - Recipes Model

public struct RecipesModel: Codable, Identifiable {
    public let id, fats, name, time: String
    public let image: String
    public let weeks: [String]
    public let carbos, fibers: String
    public let rating: Double?
    public let country: String
    public let ratings: Int?
    public let calories, headline: String
    public let keywords, products: [String]
    public let proteins: String
    public let favorites, difficulty: Int
    public let welcomeDescription: String
    public let highlighted: Bool
    public let ingredients: [String]
    public let deliverableIngredients: [String]

    enum CodingKeys: String, CodingKey {
        case id, fats, name, time, image, weeks, carbos, fibers, rating, country, ratings, calories, headline, keywords, products, proteins, favorites, difficulty
        case welcomeDescription = "description"
        case highlighted, ingredients
        case deliverableIngredients = "deliverable_ingredients"
    }
}
