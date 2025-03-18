//
//  RemoteRepositoryImplementation.swift
//  FoodicsApp
//
//  Created by islam Awaad on 18/03/2025.
//

import Foundation


public class RemoteRepositoryImplementation: RemoteRepository {

    // MARK: - Properties
    
    @MainActor public static let shared = RemoteRepositoryImplementation()

    private var remoteRepository: DataSource
    
    // MARK: - Init
    
    private init() {
        remoteRepository = RemoteDataSource()
    }
    
    // MARK: - APIs
    public func getData<Value: Codable>(api: APIRequest) async throws -> Value {
        try await remoteRepository.getData(api: api)
    }
}
