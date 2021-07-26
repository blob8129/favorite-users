//
//  UserViewModel.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 26/07/2021.
//

import Foundation

struct UserViewModel: Hashable, Equatable {
    let fullName: String
    let email: String
    let phone: String
    let city: String
    
    let imageData: Data?
    let isFavorite: Bool
}
