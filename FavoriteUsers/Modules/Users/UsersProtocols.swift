//
//  UsersProtocols.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 26/07/2021.
//

import Foundation

protocol UsersInteractorInput: AnyObject {
    func loadUsers()
    func willDisplayItem(at index: Int)
}

protocol UsersView: AnyObject {
    func render(_ users: [UserViewModel])
    func showError(description: String)
}
