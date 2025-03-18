//
//  RecipeDetailView.swift
//  FoodicsApp
//
//  Created by islam Awaad on 18/03/2025.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack {
                // Header with gradient background
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue, Color.purple]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 300)
                    .edgesIgnoringSafeArea(.top)

                    VStack {
                        AspectRatioImage(url: URL(string: recipe.image),
                                         aspectRatio: .init(width: UIScreen.main.bounds.width, height: 200))
                            .frame(height: 200)
                            .clipped()
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()

                        Text(recipe.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 5)

                        Text("Rating: \(recipe.rating, specifier: "%.1f") (\(recipe.reviewCount) reviews)")
                            .foregroundColor(.white)
                            .padding(.bottom, 10)

                        Text("Prep Time: \(recipe.prepTimeMinutes) mins | Cook Time: \(recipe.cookTimeMinutes) mins")
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                    }
                }
                .frame(height: 300)

                VStack(alignment: .leading) {
                    Section(header: Text("Ingredients")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.top)) {
                        TagsGridView(tags: recipe.ingredients)
                    }.padding()

                    Divider()

                    Section(header: Text("Instructions")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.top)) {
                        TagsGridView(tags: recipe.instructions)
                    }
                        .padding()

                    Divider()

                    Section(header: Text("Details")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.top)) {
                        Text("Servings: \(recipe.servings)")
                        Text("Difficulty: \(recipe.difficulty)")
                        Text("Cuisine: \(recipe.cuisine)")
                        Text("Calories: \(recipe.caloriesPerServing) per serving")
                        Text("Tags: \(recipe.tags.joined(separator: ", "))")
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                    .padding()
                }
                .background(Color(UIColor.systemBackground))
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
            }
        }
        .navigationTitle("Recipe Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TagsGridView: View {
    let tags: [String]

    var body: some View {
        let columns = [
            GridItem(.flexible(minimum: 80), spacing: 10),
            GridItem(.flexible(minimum: 80), spacing: 10),
            GridItem(.flexible(minimum: 80), spacing: 10)
        ]
        
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(tags, id: \.self) { tag in
                Text(tag)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(8)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.pink, Color.orange]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .cornerRadius(10)
                    )
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
}
