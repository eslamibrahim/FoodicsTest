//
//  MockRecipesListViewModelFactory.swift
//  FoodicsApp
//
//  Created by islam Awaad on 18/03/2025.
//

import XCTest
import NetworkLayer
import AppFlow
@testable import FoodicsApp

struct MockRecipesListViewModelFactory {
   
    @MainActor func buildViewModel() -> RecipesListViewModel {
        let recipesListUseCase: RecipesListUseCase =  RecipesListUseCaseImplementation(repository: MockRecipesListRepositoryImplementation())
        return RecipesListViewModel(recipesListUseCase: recipesListUseCase)
    }
}


struct MockRecipesListRepositoryImplementation: RecipesListRepository {

    private let repository = MockDataSource(json: "RecipesList")

    // MARK: - APIs

    func searchforRecipes(skip: Int, sortBy: String?, searchQuery: String?) async throws -> Recipes {
        let response: RecipesResponse = try await repository.getData()
        return RecipesListDTOMapper(response: response)()
    }
    
    func fetchRecipes(skip: Int, sortBy: String?) async throws -> Recipes {
        let response: RecipesResponse = try await repository.getData()
        return RecipesListDTOMapper(response: response)()
    }
    
    
}
