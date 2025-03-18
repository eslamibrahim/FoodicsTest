
//  RecipesListUseCaseImplementation.swift
//  foodics Task
//
//  Created by islam Awaad on 16/03/2025.
//

import Foundation

public struct RecipesListUseCaseImplementation: RecipesListUseCase {
    
    // MARK: - Properties
    
    private var repository: RecipesListRepository
    
    // MARK: - Init
    
    public init(repository: RecipesListRepository) {
        self.repository = repository
    }
    
    // MARK: - APIs
    
    func searchforRecipes(skip: Int, sortBy: String?, searchQuery: String?) async throws -> Recipes {
        try await repository.searchforRecipes(skip: skip, sortBy: sortBy, searchQuery: searchQuery)
    }

    func fetchRecipes(skip: Int, sortBy: String?) async throws -> Recipes {
        try await repository.fetchRecipes(skip: skip, sortBy: sortBy)
    }
    
}
