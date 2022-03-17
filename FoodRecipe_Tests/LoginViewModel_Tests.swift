//
//  LoginViewModel_Tests.swift
//  FoodRecipe_Tests
//
//  Created by MorsyElsokary on 16/03/2022.
//

import XCTest
@testable import FoodRecipe

class LoginViewModel_Tests: XCTestCase {
    var sut: LoginViewModel!

    override func setUp() {
        sut = LoginViewModel()
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_LoginViewModel_userName_shouldBeEmptyWhenVMInit() {
        // Then
        XCTAssertTrue(sut.username.isEmpty)
    }
    
    func test_LoginViewModel_password_shouldBeEmptyWhenVMInit() {
        // Then
        XCTAssertTrue(sut.password.isEmpty)
    }
    
    func test_LoginViewModel_shouldLogin_shouldBeFalseWhenVMInit() {
        // Then
        XCTAssertFalse(sut.shouldLogin)
    }
    
    func test_LoginViewModel_error_shouldBeFalseWhenVMInit() {
        // Then
        XCTAssertFalse(sut.error)
    }
    
    func test_LoginViewModel_errorMessage_shouldBeEmptyWhenVMInit() {
        // Then
        XCTAssertTrue(sut.errorMessage.isEmpty)
    }
    
    func test_LoginViewModel_login_shouldFailWhenSendingTheWrongCredentials() {
        // Given
        sut.username = ""
        sut.password = ""
        
        // When
        sut.login()
        
        // Then
        XCTAssertFalse(sut.shouldLogin)
    }
    
    func test_LoginViewModel_login_shouldSucceedWhenSendingTheWrongCredentials() {
        // Given
        sut.username = "PoMac"
        sut.password = "12345678"
        
        // When
        sut.login()
        
        // Then
        XCTAssertTrue(sut.shouldLogin)
    }
}
