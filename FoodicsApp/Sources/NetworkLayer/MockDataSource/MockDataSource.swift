//
//  MockDataSource.swift
//  FoodicsApp
//
//  Created by islam Awaad on 18/03/2025.
//

import Foundation

public struct MockDataSource: LocalRepository {
    
    // MARK: - Properties
    
    private let json: String?
    
    // MARK: - Init
    
    public init(json: String?) {
        self.json = json
    }
    
    // MARK: - APIs
    
    public func getData<Value: Codable>() async throws -> Value {
        return try LocalJsonParser().getData(json: json)
    }
}
