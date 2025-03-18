//
//  Recipe.swift
//  FoodicsApp
//
//  Created by islam Awaad on 17/03/2025.
//

@MainActor
public struct Recipe: Identifiable, Hashable {
    public let id: Int
    let name: String
    let ingredients: [String]
    let instructions: [String]
    let prepTimeMinutes: Int
    let cookTimeMinutes: Int
    let servings: Int
    let difficulty: String
    let cuisine: String
    let caloriesPerServing: Int
    let tags: [String]
    let image: String
    let rating: Double
    let reviewCount: Int
    let mealType: [String]
    
    public init(id: Int, name: String, ingredients: [String], instructions: [String], prepTimeMinutes: Int, cookTimeMinutes: Int, servings: Int, difficulty: String, cuisine: String, caloriesPerServing: Int, tags: [String], image: String, rating: Double, reviewCount: Int, mealType: [String]) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.instructions = instructions
        self.prepTimeMinutes = prepTimeMinutes
        self.cookTimeMinutes = cookTimeMinutes
        self.servings = servings
        self.difficulty = difficulty
        self.cuisine = cuisine
        self.caloriesPerServing = caloriesPerServing
        self.tags = tags
        self.image = image
        self.rating = rating
        self.reviewCount = reviewCount
        self.mealType = mealType
    }
}

public struct Recipes {
    
     let recipes: [Recipe]
    
     let pagination: Pagination
    
    public init(recipes: [Recipe], pagination: Pagination) {
        self.recipes = recipes
        self.pagination = pagination
    }
}


struct RecipesResponse: Codable {
    let recipes: [RecipeResponse]
    let total, skip, limit: Int
}

struct RecipeResponse: Codable {

    let id: Int
    let name: String
    let ingredients: [String]
    let instructions: [String]
    let prepTimeMinutes: Int
    let cookTimeMinutes: Int
    let servings: Int
    let difficulty: String
    let cuisine: String
    let caloriesPerServing: Int
    let tags: [String]
    let image: String
    let rating: Double
    let reviewCount: Int
    let mealType: [String]
    
}

