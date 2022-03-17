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
    public let carbos, fibers: String
    public let rating: Double?
    public let ratings: Int?
    public let calories, headline: String
    public let proteins: String
    public let difficulty: Int
    public let welcomeDescription: String
    public let highlighted: Bool
    public let ingredients: [String]

    enum CodingKeys: String, CodingKey {
        case id, fats, name, time, image, carbos, fibers, rating, ratings, calories, headline, proteins, difficulty
        case welcomeDescription = "description"
        case highlighted, ingredients
    }
    public init(id: String, fats: String, name: String, time: String, image: String, carbos: String, fibers: String, rating: Double?, ratings: Int?, calories: String, headline: String, proteins: String, difficulty: Int, welcomeDescription: String, highlighted: Bool, ingredients: [String]) {
        self.id = id
        self.fats = fats
        self.name = name
        self.time = time
        self.image = image
        self.carbos = carbos
        self.fibers = fibers
        self.rating = rating
        self.ratings = ratings
        self.calories = calories
        self.headline = headline
        self.proteins = proteins
        self.difficulty = difficulty
        self.welcomeDescription = welcomeDescription
        self.highlighted = highlighted
        self.ingredients = ingredients
    }
}
 
