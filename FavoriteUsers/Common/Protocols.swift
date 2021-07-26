//
//  Protocols.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 26/07/2021.
//

protocol Convertible {
    associatedtype ToType
    associatedtype ContextType

    func convert(using context: ContextType) -> ToType
}


extension Array: Convertible where Element: Convertible {
    typealias ToType = [Element.ToType]
    typealias ContextType = Element.ContextType

    func convert(using context: Element.ContextType) -> ToType {
        map { $0.convert(using: context) }
    }
}
