//
//  RecipesListViewModelFactory.swift
//  FoodicsApp
//
//  Created by islam Awaad on 17/03/2025.
//

import Foundation
import NetworkLayer

public struct RecipesListViewModelFactory {
    
    public init() {}

    @MainActor
    public func viewModel() -> RecipesListViewModel {
        let recipesListRepository: RecipesListRepository = RecipesListRepositoryImplementation(repository: RemoteRepositoryImplementation.shared)
        let recipesListUseCase: RecipesListUseCase = RecipesListUseCaseImplementation(repository: recipesListRepository)
        return RecipesListViewModel(recipesListUseCase: recipesListUseCase)
    }
    
}
