//
//  LoginInteractorTests.swift
//  FavoriteUsersTests
//
//  Created by Andrey Volobuev on 27/07/2021.
//

import XCTest
@testable import FavoriteUsers


class LoginViewSpy: LoginViewProtocol {
    
    var successCount = 0
    var errorCount = 0
    
    func renderSuccess(complition: @escaping () -> Void) {
        successCount += 1
        complition()
    }
    
    func showError(description: String) {
        errorCount += 1
    }
}

let anyTestURL = URL(string: "https://abc@xyz.com")!

class LoginInteractorTests: XCTestCase {

    func testLoggedInStateEncoding() throws {
        let repositoryStub = TokenContainerRepository(networkService: NetworkServiceStub(),
                                                  decoder: JSONDecoder())
        let interactor = LoginInteractor(baseURL: anyTestURL,
                                         tokenContainerRepository: repositoryStub)
        let loginViewSpy = LoginViewSpy()
        interactor.view = loginViewSpy
        
        interactor.logIn(username: "any username", password: "any password")
        
        XCTAssertEqual(loginViewSpy.successCount, 1)
        XCTAssertEqual(loginViewSpy.errorCount, 0)
    }
}
