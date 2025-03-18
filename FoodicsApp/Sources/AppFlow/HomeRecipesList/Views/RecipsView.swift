//
//  RecipsView.swift
//  FoodicsApp
//
//  Created by islam Awaad on 17/03/2025.
//

import SwiftUI

public struct RecipsView<ViewModel: RecipesListViewModel>: View {
    
    @StateObject var viewModel: ViewModel
    
    public init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Sort by:")
                        .bold()
                        .padding(.horizontal)
                    Picker("Sort by", selection: $viewModel.status.sortBy) {
                        ForEach(RecipesListViewModel.Status.SortBy.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(.palette)
                }
                ScrollView {
                    switch viewModel.status.state {
                    case .idle:
                        EmptyView()
                    case .error(let error):
                        ContentUnavailableView(error.localizedDescription, systemImage: "exclamationmark.triangle")
                    case .loaded(let recipes):
                        RecipsListView(recipes: recipes.recipes,
                                       didReachRecipe: $viewModel.didReachRecipe)
                    case .loading:
                        ProgressView()
                    }
                }
            }
        }
        .navigationTitle("Recips List View")
        .searchable(text: Binding (get: {
            viewModel.status.searchValue
        }, set: { value in
            viewModel.status.searchValue = value
        }), placement: .navigationBarDrawer(displayMode: .always))
        .overlay {
            if let recipes = viewModel.currentRecipes?.recipes,
               recipes.isEmpty, !viewModel.status.isLoading {
                if viewModel.status.searchValue.isEmpty {
                    ContentUnavailableView("No Recips", systemImage: "icloud.slash")
                } else {
                    ContentUnavailableView.search(text: viewModel.status.searchValue)
                }
            }
        }
        .onReceive(viewModel.$didReachRecipe) { index in
            viewModel.didReachRecipe(index)
        }
        .onChange(of: viewModel.status.sortBy, { oldValue, newValue in
            if oldValue != newValue {
                viewModel.getRecipes()
            }
        })
        .onAppear {
            viewModel.getRecipes()
        }
        .refreshable {
            viewModel.refresh()
        }
    }
}
