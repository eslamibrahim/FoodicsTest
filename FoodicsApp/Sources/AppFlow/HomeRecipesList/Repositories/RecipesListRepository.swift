//
//  RecipesListRepository.swift
//  FoodicsApp
//
//  Created by islam Awaad on 17/03/2025.
//

import Foundation

@MainActor
public protocol RecipesListRepository {

    func searchforRecipes(skip: Int, sortBy: String?, searchQuery: String?) async throws -> Recipes
    
    func fetchRecipes(skip: Int, sortBy: String?) async throws -> Recipes
}
