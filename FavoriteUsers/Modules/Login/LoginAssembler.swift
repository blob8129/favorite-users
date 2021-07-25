//
//  LoginAssembler.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 22/07/2021.
//

import UIKit

struct NetworkServiceStub: NetworkServiceProtocol {
    
    var token: String?
    
    func loadData(at url: URL, result: @escaping (Result<Data, Error>) -> Void) {
        
    }
    
    func executeRequest(url: URL, httpMethod: HTTPMethod, result: @escaping (Result<Data, Error>) -> Void) {
        
    }
}

final class LoginAssembler {
    func assemble(baseURL: URL, delegate: LoginDelegate) -> UIViewController {
        let repository = TokenContainerRepository(networkService: NetworkServiceStub(),
                                                  decoder: JSONDecoder())
        let interactor = LoginInteractor(baseURL: baseURL, tokenContainerRepository: repository)
        
        let view = LoginViewController(interactor: interactor)
        
        interactor.view = view
        interactor.delegate = delegate
        
        return view
    }
}
