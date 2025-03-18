//
//  LocalRepository.swift
//  FoodicsApp
//
//  Created by islam Awaad on 18/03/2025.
//

import Foundation

@MainActor
public protocol LocalRepository {

    mutating func getData<Value: Codable>() async throws -> Value
}
