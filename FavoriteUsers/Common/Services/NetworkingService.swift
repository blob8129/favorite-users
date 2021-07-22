//
//  NetworkingService.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 22/07/2021.
//

import Foundation

protocol BasicNetworkService {
    func loadData(at url: URL, result: @escaping (Result<Data, Error>) -> Void)
}

protocol ResourceModifyingNetworkService {
    func executeRequest(url: URL, httpMethod: HTTPMethod, result: @escaping (Result<Data, Error>) -> Void)
}

protocol NetworkServiceProtocol: BasicNetworkService, ResourceModifyingNetworkService {}

public enum HTTPMethod: CustomStringConvertible {
    case get
    case post(body: [String: Any?])
    case put(body: [String: Any?])
    case delete
    
    public var description: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        }
    }
}

protocol RepositoryProtocol {
    associatedtype Entity: Decodable

    var networkService: NetworkServiceProtocol { get }
    var decoder: JSONDecoder { get }
    
    func fetch(at url: URL, result: @escaping (Result<Entity, Error>) -> Void)
    func createEntity(url: URL, input: [String: Any?], result: @escaping (Result<Entity, Error>) -> Void)
}

extension RepositoryProtocol {
    
    func fetch(at url: URL, result: @escaping (Result<Entity, Error>) -> Void) {
        networkService.loadData(at: url) { networkResult in
            decode(networkResult, decodedResult: result)
        }
    }
    
    func createEntity(url: URL, input: [String: Any?], result: @escaping (Result<Entity, Error>) -> Void) {
        networkService.executeRequest(url: url, httpMethod: .post(body: input)) { networkResult in
            decode(networkResult, decodedResult: result)
        }
    }
    
    private func decode(_ result: Result<Data, Error>,
                        decodedResult: @escaping (Result<Entity, Error>) -> Void) {
        switch result {
        case .success(let data):
            do {
                let entity = try self.decoder.decode(Entity.self, from: data)
                decodedResult(.success(entity))
            } catch let error {
                decodedResult(.failure(error))
            }
        case .failure(let error):
            decodedResult(.failure(error))
        }
    }
}
