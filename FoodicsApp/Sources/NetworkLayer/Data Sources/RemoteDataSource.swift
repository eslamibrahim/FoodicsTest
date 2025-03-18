//
//  RemoteDataSource.swift
//  FoodicsApp
//
//  Created by islam Awaad on 18/03/2025.
//

import Foundation

public struct RemoteDataSource: DataSource {

    // MARK: - Properties
    
    private let urlSessionDataSource = URLSessionDataSource()
    
    // MARK: - Init
    
    public init() {}

    // MARK: - APIs
    public func getData<Value: Codable>(api: APIRequest) async throws -> Value {
        try await urlSessionDataSource.getData(urlRequest: api.urlRequest)
    }
}
