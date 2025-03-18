
//  Pagination.swift
//  foodics Task
//
//  Created by islam Awaad on 16/03/2025.
//

import Foundation

public struct Pagination {
    
    let total, skip, limit: Int
    
    public init (total: Int, skip: Int, limit: Int) {
        self.total = total
        self.skip = skip
        self.limit = limit
    }
    
   public var isHaveNextPage: Bool {
        return total > skip + limit
    }
    
    var skipNextPage: Int {
        return skip + limit
    }
}
