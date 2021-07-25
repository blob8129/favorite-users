//
//  Extensions.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 22/07/2021.
//

import Foundation

// MARK: URL
extension URL {
    func appendingPathComponents(_ components: String..., isDirectory: Bool = false) -> URL {
        return components.reduce(self) { result, component in
            result.appendingPathComponent(component, isDirectory: isDirectory)
        }
    }
}

extension String {
    var removingISO8601Milliseconds: String {
        "\(split(separator: ".").first ?? "")Z"
    }
}

extension JSONDecoder {
    static let customISODateDecoder: JSONDecoder = { dcd in
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
}
