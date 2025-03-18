//
//  RecipesListApi.swift
//  FoodicsApp
//
//  Created by islam Awaad on 18/03/2025.
//

import Foundation

public enum RecipesListRequestType {
    case normalList
    case search
}

public struct RecipesListApi: APIRequest {
    
    // MARK: - Properties

    public var path: String {
        switch requestType {
        case .normalList:
            return #"/recipes"#
        case .search:
            return #"/recipes/search"#
        }
    }
    
    public let method: APIRequestMethod = .get
    let requestType: RecipesListRequestType
    
    public var query: [String: String]? {
        [
            "skip": String(skip),
            "limit": String(limit),
            "q": searchQuery ?? "",
            "sortBy": sortBy ?? "",
            "order": "asc"
        ]
    }

    
    private let skip: Int
    private let limit: Int = 10
    private let sortBy: String?
    private let searchQuery: String?

    // MARK: - Init
    
    public init(skip: Int, requestType: RecipesListRequestType,
         sortBy: String?, searchQuery: String?) {
        self.skip = skip
        self.requestType = requestType
        self.sortBy = sortBy
        self.searchQuery = searchQuery
    }
}
