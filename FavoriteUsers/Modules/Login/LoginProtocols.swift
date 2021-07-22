//
//  LoginProtococls.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 22/07/2021.
//

import Foundation

protocol LoginViewProtocol: AnyObject {
    func renderSuccess(complition: @escaping () -> Void)
    func showError(description: String)
}

protocol LoginInteractorInput {
    func logIn(username: String, password: String)
}

protocol LoginDelegate: AnyObject {
    func didLogInWith(token: String)
}
