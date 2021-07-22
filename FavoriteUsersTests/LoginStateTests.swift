//
//  LoginStateTests.swift
//  FavoriteUsersTests
//
//  Created by Andrey Volobuev on 22/07/2021.
//

import XCTest
@testable import FavoriteUsers

class LoginStateTests: XCTestCase {

    func testLoggedInStateEncoding() throws {
        let loginState = LoginState.loggedIn(token: "test token")
        let data = try JSONEncoder().encode(loginState)
        let decodedState = try JSONDecoder().decode(LoginState.self, from: data)
        
        XCTAssertEqual(decodedState, .loggedIn(token: "test token"))
    }
    
    func testLoggeddOutStateEncoding() throws {
        let loginState = LoginState.loggedOut
        let data = try JSONEncoder().encode(loginState)
        let decodedState = try JSONDecoder().decode(LoginState.self, from: data)
        
        XCTAssertEqual(decodedState, .loggedOut)
    }
}
