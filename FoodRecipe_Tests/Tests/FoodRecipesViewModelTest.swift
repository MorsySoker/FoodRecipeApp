//
//  FoodRecipesViewModelTest.swift
//  FoodRecipe_Tests
//
//  Created by MorsyElsokary on 16/03/2022.
//

import XCTest
import Combine
import FoodRecipeServices
@testable import FoodRecipe

class FoodRecipesViewModelTest: XCTestCase {
    
    // MARK: - Properties
    
    var sut: FoodRecipesViewModel!
    var cancellable: Set<AnyCancellable> = []

    // MARK: - Setup / Tear down
    override func setUp() {
        sut = FoodRecipesViewModel()
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func test_FoodRecipesViewModel_recipes_shouldBeEmptyWhenVMInit() {
        // Then
        XCTAssertTrue(sut.recipes.isEmpty)
    }

    func test_FoodRecipesViewModel_errorMessage_shouldBeEmptyWhenVMInit() {
        // Then
        XCTAssertTrue(sut.errorMessage.isEmpty)
    }
    
    func test_FoodRecipesViewModel_error_shouldBeFalseWhenVMInit() {
        // Then
        XCTAssertFalse(sut.error)
    }
    
    func test_FoodRecipesViewModel_getRecipes_shouldReturnItems() {
        // Given
        let mockRecipes = [RecipesModel(id: "1", fats: "58", name: "Fun", time: "12:10", image: "", carbos: "", fibers: "", rating: 1.0, ratings: 1, calories: "", headline: "", proteins: "", difficulty: 1, welcomeDescription: "", highlighted: true, ingredients: ["", "", ""]), RecipesModel(id: "2", fats: "70", name: "Funk", time: "12:10", image: "", carbos: "", fibers: "", rating: 1.0, ratings: 1, calories: "", headline: "", proteins: "", difficulty: 1, welcomeDescription: "", highlighted: true, ingredients: ["", "", ""]) ]
        
        sut = FoodRecipesViewModel(service: MockRecipesService(recipes: mockRecipes))
        
        // When
        let expectation = XCTestExpectation(description: "Should Return Items in a second")
        
        sut.$recipes
            .dropFirst()
            .sink { publishedItems in
                expectation.fulfill()
            }.store(in: &cancellable)
        
        sut.getRecipes()
        
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(sut.recipes.count, 0)
    }
}
