//
//  RecipesListViewModel.swift
//  FoodicsApp
//
//  Created by islam Awaad on 17/03/2025.
//

import Foundation
import Combine

public class RecipesListViewModel: ObservableObject {
    
    struct Status {
        var state: ViewState = .idle
        var searchValue: String = ""
        var sortBy: SortBy?
        var isLoading: Bool {
            switch state {
            case .loading:
                return true
            default:
                return false
            }
        }
        
        enum ViewState {
            case loading
            case loaded(Recipes)
            case idle
            case error(Error)
        }
        
        enum SortBy: String, CaseIterable {
            case id
            case name
        }
    }
    
    // MARK: - Properties
    
    @Published var status: Status = .init()
    
    var currentRecipes: Recipes?
    
    var filteredRecipes: Recipes?

    
    @Published var didReachRecipe: Int = 0
    
    private var Cancellable = Set<AnyCancellable>()
    
    private var recipesListUseCase: RecipesListUseCase
    
    
    // MARK: - Init
    
    init(
        recipesListUseCase: RecipesListUseCase
    ) {
        self.recipesListUseCase = recipesListUseCase
        
        $status.map(\.searchValue)
            .removeDuplicates()
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] value in
                self?.setFilteredRecipes()
            })
            .store(in: &Cancellable)
        
    }
    
    // MARK: - APIs
    
    @MainActor
    func getRecipes() {
        currentRecipes = nil
        Task {
            do {
                try await getRecipes(sortBy: status.sortBy?.rawValue)
            } catch {
                status.state = .error(error)
            }
        }
    }
    
    @MainActor
    func didReachRecipe(_ index: Int) {
        guard !status.isLoading,
              let currentRecipes,
              currentRecipes.recipes.count == (index + 2)
        else { return }
        if currentRecipes.pagination.isHaveNextPage {
            Task {
                try await getMoreRecipes(sortBy: status.sortBy?.rawValue)
            }
        }
    }
    
    private func resetState() {
        status = .init()
        currentRecipes = nil
    }
    
    @MainActor
    func refresh() {
        resetState()
        getRecipes()
    }
    
    // MARK: - Methods
    
    @MainActor
    private func getRecipes(sortBy: String?) async throws  {
        status.state = .loading
        let response =  try await recipesListUseCase.fetchRecipes(skip: currentRecipes?.pagination.skipNextPage ?? 0, sortBy: sortBy)
        status.state = .loaded(response)
        currentRecipes = response
    }
    
    @MainActor
    private func getMoreRecipes(sortBy: String?) async throws {
        let response = try await recipesListUseCase.fetchRecipes(skip: currentRecipes?.pagination.skipNextPage ?? 0, sortBy: sortBy)
        guard let currentRecipes else {
            status.state = .loaded(response)
            currentRecipes = response
            return
        }
        let recipes = currentRecipes.recipes + response.recipes
        let newRecipes = Recipes(recipes: recipes, pagination: response.pagination)
        status.state = .loaded(newRecipes)
        self.currentRecipes = newRecipes
    }
    
    // MARK: - Filter
    
    private func setFilteredRecipes() {
        guard let currentRecipes, !status.searchValue.isEmpty else {
            filteredRecipes = currentRecipes
            return
        }

        filteredRecipes = .init(recipes: currentRecipes.recipes.filter { recipe in
            let searchPredicate = status.searchValue.isEmpty ? true : recipe.name.localizedStandardContains(status.searchValue)
            return searchPredicate
        }, pagination: currentRecipes.pagination)
        status.state = .loaded(filteredRecipes ?? currentRecipes)
    }
}
