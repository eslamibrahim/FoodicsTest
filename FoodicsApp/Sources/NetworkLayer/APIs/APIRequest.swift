//
//  APIRequest.swift
//  FoodicsApp
//
//  Created by islam Awaad on 18/03/2025.
//

import Foundation

public protocol APIRequest {

    var baseURL: URL { get }
    var path: String { get }
    var method: APIRequestMethod { get }
    var query: [String: String]? { get }
    var headers: [String: String]? { get }
}

public extension APIRequest {
    
    var baseURL: URL {
        URL(string: Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as! String)!
    }
    
    var headers: [String: String]? {
        nil
    }
    
    var query: [String: String]? { nil }
}

public enum APIRequestMethod: String {

    case get, post, put, patch, delete
}

public extension APIRequest {
    
    var urlRequest: URLRequest {
        var url = baseURL.appending(path: path)
        if let queryItems = query?.compactMap({ URLQueryItem(name: $0.key, value: $0.value) }),
           !queryItems.isEmpty {
            url.append(queryItems: queryItems)
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        headers?.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        return request
    }
}
