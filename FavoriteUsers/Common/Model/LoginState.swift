//
//  LoginState.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 22/07/2021.
//

import Foundation

enum LoginState: Codable, Equatable {
    
    case loggedIn(token: String)
    case loggedOut
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let token = try? container.decode(String.self) {
            self = .loggedIn(token: token)
        } else {
            self = .loggedOut
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .loggedIn(token: let token):
            try container.encode(token)
        case .loggedOut:
            try container.encodeNil()
        }
    }
}
