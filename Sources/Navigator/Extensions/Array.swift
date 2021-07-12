//
//  Array.swift
//  Navigation
//
//  Created by dehrom on 12.07.2021.
//

import Foundation

extension Array where Element == NavigationNodeController {
    subscript(id: NavigationIdentifier) -> (index: Int, controller: NavigationNodeController)? {
        enumerated()
            .first(where: { $0.element.id == id })
            .map { ($0.offset, $0.element) }
    }
}
