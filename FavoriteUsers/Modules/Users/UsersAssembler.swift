//
//  UsersAssembler.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 25/07/2021.
//

import UIKit

final class UsersAssembler {
    func assemble(baseURL: URL, token: String) -> UIViewController {
        var networkService = UsersNetworkServiceStub()
        networkService.token = token
        let repository = UsersRepository(networkService: networkService,
                                         decoder: JSONDecoder.customISODateDecoder)
        
        let interactor = UsersInteractor(baseURL: baseURL, usersRepository: repository)
        let view = UsersViewController(interactor: interactor)
        interactor.view = view
        return view
    }
}
