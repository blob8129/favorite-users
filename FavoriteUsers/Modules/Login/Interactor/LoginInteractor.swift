//
//  LoginInteractor.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 22/07/2021.
//

import Foundation

final class LoginInteractor<R: RepositoryProtocol>: LoginInteractorInput where R.Entity == TokenContainer  {

    weak var view: LoginViewProtocol?
    weak var delegate: LoginDelegate?
    
    private let baseURL: URL
    private let tokenContainerRepository: R
    
    func logIn(username: String, password: String) {
        let url = baseURL.appendingPathComponents("api", "login")
        let input = [
            "username": username,
            "password": password
        ]
        tokenContainerRepository.createEntity(url: url, input: input) { result in
            switch result {
            case .success(let containter):
                self.view?.renderSuccess {
                    self.delegate?.didLogInWith(token: containter.token)
                }
            case .failure(let error):
                self.view?.showError(description: error.localizedDescription)
            }
        }
    }
    
    init(baseURL: URL, tokenContainerRepository: R) {
        self.baseURL = baseURL
        self.tokenContainerRepository = tokenContainerRepository
    }
}
