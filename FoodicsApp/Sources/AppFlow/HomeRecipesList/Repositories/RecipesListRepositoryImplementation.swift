//
//  RecipesListRepositoryImplementation.swift
//  FoodicsApp
//
//  Created by islam Awaad on 17/03/2025.
//

import Foundation
import NetworkLayer

struct RecipesListRepositoryImplementation: RecipesListRepository {

    // MARK: - Properties
    
    private var repository: RemoteRepository
    
    // MARK: - Init
    
    public init(repository: RemoteRepository) {
        self.repository = repository
    }
    
    // MARK: - APIs
    
    public func fetchRecipes(skip: Int, sortBy: String?) async throws -> Recipes {
        let response: RecipesResponse = try await repository.getData(api: RecipesListApi(skip: skip, requestType: .normalList , sortBy: sortBy, searchQuery: nil))
        return RecipesListDTOMapper(response: response)()
    }
    
    public func searchforRecipes(skip: Int, sortBy: String?, searchQuery: String?) async throws -> Recipes {
        let response: RecipesResponse = try await repository.getData(api: RecipesListApi(skip: skip, requestType: .normalList , sortBy: sortBy, searchQuery: searchQuery))
        return RecipesListDTOMapper(response: response)()
    }
    
}
