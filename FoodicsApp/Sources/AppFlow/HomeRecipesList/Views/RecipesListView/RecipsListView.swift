//
//  RecipsListView.swift
//  FoodicsApp
//
//  Created by islam Awaad on 17/03/2025.
//

import SwiftUI
import Combine

struct RecipsListView: View {
    
    var recipes: [Recipe]
    
    @Binding var didReachRecipe: Int
        
    private let columns = (0..<2).map { _ in GridItem(.flexible()) }

    var body: some View {

        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(Array(recipes.enumerated()), id: \.element.id) { element in
                NavigationLink {
                    RecipeDetailView(recipe: recipes[element.offset])
                } label: {
                    RecipItemView(recipe: recipes[element.offset])
                        .onAppear {
                            didReachRecipe = element.offset
                        }
                }
            }
        }
        .padding()
    }
}
