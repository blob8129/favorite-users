//
//  ImagesService.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 26/07/2021.
//

import Foundation

protocol ImagesServiceProtocol {
    func fetchImage(at url: URL, result: @escaping (Result<(URL, Data), Error>) -> Void)
}

final class ImagesService: ImagesServiceProtocol {
    enum ImagesServiceError: Error {
        case unknown
    }
    
    func fetchImage(at url: URL, result: @escaping (Result<(URL, Data), Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                result(.failure(error ?? ImagesServiceError.unknown))
                return
            }
            result(.success((url, data)))
        }
        task.resume()
    }
}
