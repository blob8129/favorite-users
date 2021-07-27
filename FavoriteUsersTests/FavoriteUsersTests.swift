//
//  FavoriteUsersTests.swift
//  FavoriteUsersTests
//
//  Created by Andrey Volobuev on 21/07/2021.
//

import XCTest
@testable import FavoriteUsers


struct StorageMock<T: Encodable>: AnyStorage {
    
    var value: T?
    
    func set(_ value: Any?, forKey defaultName: String) {
        
    }
    
    func data(forKey defaultName: String) -> Data? {
        value.flatMap { try? JSONEncoder().encode($0) }
    }
    
    func removeObject(forKey defaultName: String) {
        
    }
}

class ImagesServiceSpy: ImagesServiceProtocol {
    
    var fetchCount = 0
    
    func fetchImage(at url: URL, result: @escaping (Result<(URL, Data), Error>) -> Void) {
        fetchCount += 1
    }
}

class UsersViewSpy: UsersView {
    
    var viewModels: [UserViewModel]?
    var errorCount = 0
    
    func render(_ users: [UserViewModel]) {
        self.viewModels = users
    }
    
    func showError(description: String) {
        errorCount += 1
    }
}

class FavoriteUsersTests: XCTestCase {

    let validToken = "886:f6759e94-bf49-4d53-afe8-8d3fc93efdf0"
    
    func testAuthorizedUsersRequest() throws {
        let interactor = UsersInteractor<UsersRepository>.build(authToken: validToken)
        let usersViewSpy = UsersViewSpy()
        interactor.view = usersViewSpy
        
        interactor.loadUsers()
        
        XCTAssertEqual(usersViewSpy.viewModels?.count, 15)
        XCTAssertTrue((usersViewSpy.viewModels ?? []).allSatisfy { $0.isFavorite == false })
        XCTAssertEqual(usersViewSpy.errorCount, 0)
    }
    
    func testUnauthorizedUsersRequest() throws {
        let interactor = UsersInteractor<UsersRepository>.build(authToken: "invalid token")
        let usersViewSpy = UsersViewSpy()
        interactor.view = usersViewSpy
        
        interactor.loadUsers()
        
        XCTAssertNil(usersViewSpy.viewModels)
        XCTAssertEqual(usersViewSpy.errorCount, 1)
    }
    
    func testFavoriteUserssRequest() throws {
        let phone1 = "(733)-714-7182"
        let phone2 = "(438)-147-1077"
        let interactor = UsersInteractor<UsersRepository>
            .build(authToken: validToken, isFavoriteSates: [phone1: true, phone2: true])
        let usersViewSpy = UsersViewSpy()
        interactor.view = usersViewSpy
        
        interactor.loadUsers()
        
        let user1 = usersViewSpy.viewModels?.first { $0.phone == phone1 }
        let user2 = usersViewSpy.viewModels?.first { $0.phone == phone2 }
        XCTAssertEqual(user1?.isFavorite, true)
        XCTAssertEqual(user2?.isFavorite, true)
        let usersExceptFavorite = (usersViewSpy.viewModels ?? []).filter { $0.phone == phone1 && $0.phone == phone2 }
        XCTAssertTrue(usersExceptFavorite.allSatisfy { $0.isFavorite == false })
    }
    
    func testChangeIsFavoriteStateTrue() throws {
        let interactor = UsersInteractor<UsersRepository>.build(authToken: validToken)
        let usersViewSpy = UsersViewSpy()
        interactor.view = usersViewSpy
        
        interactor.loadUsers()
        interactor.changeIsFavoriteState(at: 0)
        
        let user1 = usersViewSpy.viewModels?.first { $0.phone == "20335909" }
        XCTAssertEqual(user1?.isFavorite, true)
    }
    
    func testChangeIsFavoriteStateFalse() throws {
        let phone1 = "20335909"
        let interactor = UsersInteractor<UsersRepository>.build(authToken: validToken, isFavoriteSates: [phone1: true])
        let usersViewSpy = UsersViewSpy()
        interactor.view = usersViewSpy
        
        interactor.loadUsers()
        interactor.changeIsFavoriteState(at: 0)
        
        let user1 = usersViewSpy.viewModels?.first { $0.phone == phone1 }
        XCTAssertEqual(user1?.isFavorite, false)
    }
    
    func testImagesLoadedOnItemWillAppear() throws {
        let imagesServiceSpy = ImagesServiceSpy()
        let interactor = UsersInteractor<UsersRepository>.build(authToken: validToken, imagesService: imagesServiceSpy)
        let usersViewSpy = UsersViewSpy()
        interactor.view = usersViewSpy
        
        interactor.loadUsers()
        interactor.willDisplayItem(at: 0)
        interactor.willDisplayItem(at: 1)
        interactor.willDisplayItem(at: 2)
        
        XCTAssertEqual(imagesServiceSpy.fetchCount, 3)
    }
}

extension UsersInteractor {
    static func build(authToken: String,
                      isFavoriteSates: [String: Bool]? = nil,
                      imagesService: ImagesServiceProtocol = ImagesServiceSpy()) -> UsersInteractor<UsersRepository> {
        var networkService = UsersNetworkServiceStub()
        networkService.token = authToken
        
        let repository = UsersRepository(networkService: networkService, decoder: JSONDecoder.customISODateDecoder)
        
        var storageMock = StorageMock<[String: Bool]>()
        storageMock.value = isFavoriteSates
        let isFavoriteStateStorage = PersistentStorage<[String: Bool]>(storageKey: "any key", defaults: storageMock)
        
        return UsersInteractor<UsersRepository>(baseURL: anyTestURL,
                                                usersRepository: repository,
                                                imagesService: imagesService,
                                                isFavoriteStateStorage: isFavoriteStateStorage)
    }
}
