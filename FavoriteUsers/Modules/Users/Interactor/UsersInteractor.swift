//
//  UsersInteractor.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 25/07/2021.
//

import Foundation

enum NetworkingError: Error {
    case unauthorized
}

protocol UsersInteractorInput: AnyObject {
    func loadUsers()
}

protocol UsersView: AnyObject {
    func render(_ users: [User])
    func showError(description: String)
}

struct UsersNetworkServiceStub: NetworkServiceProtocol {
    
    var token: String?
    
    func loadData(at url: URL, result: @escaping (Result<Data, Error>) -> Void) {
        guard let token = token, token == "886:f6759e94-bf49-4d53-afe8-8d3fc93efdf0" else {
            result(.failure(NetworkingError.unauthorized))
            return
        }
        result(.success(usersData))
    }
    
    func executeRequest(url: URL, httpMethod: HTTPMethod, result: @escaping (Result<Data, Error>) -> Void) {
        
    }
}

struct UsersRepository: RepositoryProtocol {
    let networkService: NetworkServiceProtocol
    let decoder: JSONDecoder
    
    typealias Entity = UsersContainer
}

final class UsersInteractor<R: RepositoryProtocol>: UsersInteractorInput where R.Entity == UsersContainer {
   
    weak var view: UsersView?
  
    private let baseURL: URL
    private let usersRepository: R
    
    init(baseURL: URL, usersRepository: R) {
        self.baseURL = baseURL
        self.usersRepository = usersRepository
    }
    
    // MARK: UsersInteractorInput
    func loadUsers() {
        let url = baseURL.appendingPathComponents("api", "users")
        usersRepository.fetch(at: url) { result in
            switch result {
            case .success(let usersContainer):
                self.view?.render(usersContainer.users)
            case .failure(let error):
                self.view?.showError(description: error.localizedDescription)
            }
        }
    }
}
