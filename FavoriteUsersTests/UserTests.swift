//
//  UserTests.swift
//  FavoriteUsersTests
//
//  Created by Andrey Volobuev on 25/07/2021.
//

import XCTest
@testable import FavoriteUsers

class UserTests: XCTestCase {
    
    lazy var testDecoder: JSONDecoder = { dcd in
        dcd.dateDecodingStrategy = .custom { dateDecoder in
            let container = try dateDecoder.singleValueContainer()
            let rawDate = try container.decode(String.self)
            let dateFormatter = ISO8601DateFormatter()
            guard let date = dateFormatter.date(from: rawDate.removingISO8601Milliseconds) else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Cannot decode date from \(rawDate)"
                )
            }
            return date
        }
        return dcd
    }(JSONDecoder())
    
    func testUserDecoding() throws {
        let data =
        #"""
        {
          "name": {
            "title": "Mr",
            "first": "Nikolai",
            "last": "Skavhaug"
          },
          "location": {
            "street": {
              "number": 9852,
              "name": "Røatoppen"
            },
            "city": "Hareid",
            "state": "Akershus",
            "country": "Norway",
            "postcode": "0125",
            "coordinates": {
              "latitude": "55.0942",
              "longitude": "-116.8376"
            },
            "timezone": {
              "offset": "+1:00",
              "description": "Brussels, Copenhagen, Madrid, Paris"
            }
          },
          "email": "nikolai.skavhaug@example.com",
          "dob": {
            "date": "1963-11-08T06:48:32.229Z",
            "age": 58
          },
          "phone": "20335909",
          "picture": {
            "large": "https://randomuser.me/api/portraits/men/87.jpg",
            "medium": "https://randomuser.me/api/portraits/med/men/87.jpg",
            "thumbnail": "https://randomuser.me/api/portraits/thumb/men/87.jpg"
          }
        }
        """#.data(using: .utf8)!

        let user = try testDecoder.decode(User.self, from: data)
        XCTAssertEqual(user.email, "nikolai.skavhaug@example.com")
    }
    
    func testAllUsersDecoding() throws {
        let usersContainer = try testDecoder.decode(UsersContainer.self, from: usersData)
        XCTAssertEqual(usersContainer.users.count, 15)
    }
}
