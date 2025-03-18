//
//  LocalJsonParser.swift
//  FoodicsApp
//
//  Created by islam Awaad on 18/03/2025.
//

import Foundation

class LocalJsonParser {
    
    func getData<Value: Codable>(json: String?) throws -> Value {
        let bundle = Bundle.module
        
        guard let url = bundle.url(forResource: json, withExtension: "json") else {
            fatalError("JSON file '\(json ?? "")' not found in the bundle")
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(Value.self, from: data)
        } catch {
            throw error
        }
    }
}
