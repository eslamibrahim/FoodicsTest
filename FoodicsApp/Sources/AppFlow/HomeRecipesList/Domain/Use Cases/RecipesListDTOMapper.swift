
//  RecipesListDTOMapper.swift
//  foodics Task
//
//  Created by islam Awaad on 16/03/2025.
//

import Foundation

@MainActor
 struct RecipesListDTOMapper {
    
    // MARK: - Properties
    
    private let response: RecipesResponse
    
    // MARK: - Init
    
     init(response: RecipesResponse) {
        self.response = response
    }
    
    // MARK: - APIs
    
     func callAsFunction() -> Recipes {
         return Recipes.init(recipes: response.recipes.compactMap({ recipeResponse in
             Recipe(id: recipeResponse.id, name: recipeResponse.name, ingredients: recipeResponse.ingredients, instructions: recipeResponse.instructions, prepTimeMinutes: recipeResponse.prepTimeMinutes, cookTimeMinutes: recipeResponse.cookTimeMinutes, servings: recipeResponse.servings, difficulty: recipeResponse.difficulty, cuisine: recipeResponse.cuisine, caloriesPerServing: recipeResponse.caloriesPerServing, tags: recipeResponse.tags, image: recipeResponse.image, rating: recipeResponse.rating, reviewCount: recipeResponse.reviewCount, mealType: recipeResponse.mealType)
         }), pagination: .init(total: response.total, skip: response.skip, limit: response.limit))
     }
}
