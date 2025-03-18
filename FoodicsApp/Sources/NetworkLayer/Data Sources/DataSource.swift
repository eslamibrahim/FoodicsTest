//
//  DataSource.swift
//  FoodicsApp
//
//  Created by islam Awaad on 18/03/2025.
//

import Foundation

@MainActor
public protocol DataSource {

    mutating func getData<Value: Codable>(api: APIRequest) async throws -> Value
}
