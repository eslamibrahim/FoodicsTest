//
//  RecipItemView.swift
//  FoodicsApp
//
//  Created by islam Awaad on 17/03/2025.
//

import SwiftUI
import Kingfisher

struct RecipItemView: View {
    
    let recipe: Recipe
    
    public var body: some View {
        VStack(alignment: .center) {
            
            AspectRatioImage(url: URL(string: recipe.image),
                             aspectRatio: .init(width: 130, height: 130))
            .frame(width: 130, height: 130)
            

            Text(recipe.name)
                .lineLimit(1)
                .font(.headline)
                .padding(.top, 5)
            
            Text("Rating: \(recipe.rating, specifier: "%.1f") (\(recipe.reviewCount) reviews)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Prep Time: \(recipe.prepTimeMinutes) mins | Cook Time: \(recipe.cookTimeMinutes) mins")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Servings: \(recipe.servings)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Divider()
        }
    }
}



public struct AspectRatioImage: View {
    let url: URL?
    let aspectRatio: CGSize
    @Environment(\.redactionReasons) var redactionReasons
    
   public init(url: URL?, aspectRatio: CGSize) {
        self.url = url
        self.aspectRatio = aspectRatio
    }
    
    public var body: some View {
        Rectangle()
            .aspectRatio(
                aspectRatio,
                contentMode: .fill
            )
            .overlay(FillImage(url: url, aspectRatio: aspectRatio))
            .clipShape(
                RoundedRectangle(cornerRadius: 8)
            )
            .foregroundColor(.clear)
    }
}

public struct FillImage: View {
    let url: URL?
    let aspectRatio: CGSize
    @Environment(\.redactionReasons) var redactionReasons

    public init(url: URL?, aspectRatio: CGSize) {
         self.url = url
         self.aspectRatio = aspectRatio
     }
    
    public var body: some View {
        if redactionReasons.isEmpty {
                KFImage(url)
                    .resizable()
                    .placeholder{ _ in
                        Color.gray
                    }
                    .aspectRatio(aspectRatio, contentMode: .fill)
                    .clipped()
        } else {
            Color.gray
        }
    }
}

