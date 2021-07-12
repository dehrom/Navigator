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
    
    func previousNode(for id: NavigationIdentifier) -> (index: Int, controller: NavigationNodeController)? {
        guard
            let index = self[id]?.index,
            let first = first
        else { return nil }
        
        guard
            index > startIndex
        else { return (0, first) }
        
        let previousIndex = self.index(before: index)
        let previousController = self[previousIndex]
        
        return (previousIndex, previousController)
    }
    
    func nextNode(for id: NavigationIdentifier) -> (index: Int, controller: NavigationNodeController)? {
        guard
            let index = self[id]?.index,
            let last = last
        else { return nil }
        
        guard
            index == endIndex - 1
        else { return (endIndex - 1, last) }

        let nextIndex = self.index(after: index)
        let nextController = self[nextIndex]
        
        return (nextIndex, nextController)
    }
}
