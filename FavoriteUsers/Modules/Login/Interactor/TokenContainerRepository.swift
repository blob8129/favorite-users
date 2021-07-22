//
//  TokenContainerRepository.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 22/07/2021.
//

import Foundation

struct TokenContainerRepository: RepositoryProtocol {
    let networkService: NetworkServiceProtocol
    let decoder: JSONDecoder
    typealias Entity = TokenContainer
}

extension TokenContainerRepository {
    func createEntity(url: URL,
                      input: [String : Any?],
                      result: @escaping (Result<TokenContainer, Error>) -> Void) {
        
        result(.success(TokenContainer(token: "886:f6759e94-bf49-4d53-afe8-8d3fc93efdf0")))
    }
}
