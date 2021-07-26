//
//  UsersNetworkServiceStub.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 26/07/2021.
//

import Foundation

enum NetworkingError: Error {
    case unauthorized
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
