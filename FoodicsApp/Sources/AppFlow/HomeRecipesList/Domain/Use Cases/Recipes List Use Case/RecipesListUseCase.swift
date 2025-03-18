
//  RecipesListUseCase.swift
//  foodics Task
//
//  Created by islam Awaad on 16/03/2025.
//
import Foundation

@MainActor
protocol RecipesListUseCase {
    
    func searchforRecipes(skip: Int, sortBy: String?, searchQuery: String?) async throws -> Recipes
    
    func fetchRecipes(skip: Int, sortBy: String?) async throws -> Recipes 
}
