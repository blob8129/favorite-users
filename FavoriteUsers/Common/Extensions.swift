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
