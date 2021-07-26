//
//  User.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 25/07/2021.
//

import Foundation

protocol Entity: Decodable & Hashable & Equatable {}

struct User: Entity {
    struct Name: Entity {
        let title: String
        let first: String
        let last: String
    }
    struct Location: Entity {
        struct Street: Entity {
            let number: Int
            let name: String
        }
        struct Coordinates: Entity {
            let latitude: String
            let longitude: String
        }
        struct Timezone: Entity {
            let offset: String
            let description: String
        }
        let country: String
        let state: String
        let city: String
        let street: Street
        let postcode: String
        let coordinates: Coordinates
        let timezone: Timezone
        
        enum CodingKeys: CodingKey {
            case country, state, city, street, postcode, coordinates, timezone
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.country = try container.decode(String.self, forKey: .country)
            self.state = try container.decode(String.self, forKey: .state)
            self.city = try container.decode(String.self, forKey: .city)
            self.street = try container.decode(Street.self, forKey: .street)
            if let postcodeNum = try? container.decode(Int.self, forKey: .postcode) {
                self.postcode = "\(postcodeNum)"
            } else {
                self.postcode = try container.decode(String.self, forKey: .postcode)
                
            }
            self.coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
            self.timezone = try container.decode(Timezone.self, forKey: .timezone)
        }
    }
    struct DateOfBirth: Entity {
        let date: Date
        let age: Int
    }
    struct Picture: Entity {
        let large: URL
        let medium: URL
        let thumbnail: URL
    }
    let name: Name
    let location: Location
    let email: String
    let dateOfBirth: DateOfBirth
    let phone: String
    let picture: Picture
    
    enum CodingKeys: String, CodingKey {
        case name, location, email, dateOfBirth = "dob", phone, picture
    }
}

struct UsersContainer: Decodable {
    let users: [User]
    
    enum CodingKeys: String, CodingKey {
        case users = "data"
    }
}

struct UserContext {
    let imageData: [URL: Data]
    let isFavorite: Bool
}

extension User: Convertible {
    typealias ToType = UserViewModel
    typealias ContextType = UserContext
    
    func convert(using context: UserContext) -> UserViewModel {
        UserViewModel(fullName: "\(name.title) \(name.first) \(name.last)",
                      email: email,
                      phone: phone,
                      city: location.city,
                      imageData: context.imageData[picture.medium],
                      isFavorite: context.isFavorite
        )
    }
}
