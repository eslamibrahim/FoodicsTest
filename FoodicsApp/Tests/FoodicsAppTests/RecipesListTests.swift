//
//  RecipesListTests.swift
//  FoodicsApp
//
//  Created by islam Awaad on 18/03/2025.
//

import XCTest
import NetworkLayer
import AppFlow
import Combine

@testable import FoodicsApp

final class RecipesListTests: XCTestCase {
    
    var sut: RecipesListViewModel!
    
    @MainActor
    override func setUp() async throws {
        self.sut = MockRecipesListViewModelFactory().buildViewModel()
    }
    
    override func tearDown() async throws {
        self.sut = nil
    }
    
    func testEmptyRecipes() throws {
        XCTAssertTrue((sut.currentRecipes?.recipes.isEmpty) ?? true)
    }
    
    @MainActor
    func testPagination() async throws {
        try await sut.getRecipes(sortBy: nil)
        let currentRecipes = sut.currentRecipes
        XCTAssertTrue(currentRecipes?.pagination.isHaveNextPage ?? false)
    }

    @MainActor
    func testGetRecipes() async throws {
        XCTAssertTrue((sut.currentRecipes?.recipes.isEmpty) ?? true)
        try await sut.getRecipes(sortBy: nil)
        let recipes = sut.currentRecipes?.recipes ?? []
        XCTAssertFalse(recipes.isEmpty)
        XCTAssertEqual(recipes.count, 30)
        XCTAssertEqual(recipes.first?.id, 1)
        XCTAssertEqual(recipes.first?.name, "Classic Margherita Pizza")
    }
    
    @MainActor
    func testSearchNonEmptyValue() async throws {
        try await executeSearchTest(for: "no Result", expectedCount: 0)
        try await executeSearchTest(for: "cla", expectedCount: 1)
        try await executeSearchTest(for: "Ve", expectedCount: 1)
        try await executeSearchTest(for: "ch", expectedCount: 11)
        try await executeSearchTest(for: "", expectedCount: 30)
    }

    @MainActor
    private func executeSearchTest(for value: String, expectedCount: Int) async throws {
        let expectation = expectation(description: "Search debounce by 0.5 sec")
        try await sut.getRecipes(sortBy: nil)
        sut.status.searchValue = value
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 0.6)
        XCTAssertEqual(sut.filteredRecipes?.recipes.count, expectedCount)
    }
    
}
