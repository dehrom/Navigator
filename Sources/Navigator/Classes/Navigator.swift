//
//  Navigator.swift
//  Navigation
//
//  Created by dehrom on 08.07.2021.
//

import SwiftUI
import Foundation

public typealias NavigationIdentifier = UUID

public final class Navigator {
    init(rootNodeController: NavigationNodeController, factory: ModifierFactory) {
        self.rootNodeController = rootNodeController
        self.stack = [rootNodeController]
        self.factory = factory
    }
    
    private var stack: [NavigationNodeController] = []
    private let rootNodeController: NavigationNodeController
    private let factory: ModifierFactory
}

public extension Navigator {
    @discardableResult
    func push<V: View>(_ view: V?) -> NavigationIdentifier? {
        guard let view = view else { return nil }
        let last = stack.last ?? rootNodeController
        let id = push(AnyView(view), using: last)
        return id
    }
    
    func pop(by id: NavigationIdentifier?) {
        guard
            let id = id,
            let entry = stack[id]
        else { return }
        
        guard entry.index > stack.startIndex else {
            popToRoot()
            return
        }
        
        let previousIndex = entry.index - 1
        pop(by: stack[previousIndex].id)
    }
    
    func popLast() {
        guard
            let last = stack.last,
            let entry = stack.previousNode(for: last.id)
        else { return }
        
        last.pop()
        stack.remove(at: stack.endIndex - 1)
        
        entry.controller.pop()
        
        if stack.isEmpty {
            stack = [rootNodeController]
        }
    }
    
    func popToRoot() {
        guard let root = stack.first else { return }
        root.pop()
        stack = [root]
    }
}

private extension Navigator {
    func push(_ view: AnyView, using last: NavigationNodeController) -> NavigationIdentifier {
        let node = createNewNode(with: view)
        
        last.push(node.view)
        stack.append(node.controller)
        
        return node.controller.id
    }
    
    func pop(by id: NavigationIdentifier) {
        guard let entry = stack[id] else {
            assertionFailure("There is always should be an entry at this point!")
            return
        }
        entry.controller.pop()
        stack.removeSubrange(entry.index..<stack.count)
    }
    
    func createNewNode(with view: AnyView) -> (view: AnyView, controller: NavigationNodeController) {
        let controller = NavigationNodeController(with: NavigationIdentifier())
        
        let modifier = factory.produce(with: controller) { [self] in
            let nextIndex = stack.nextNode(for: controller.id)?.index ?? stack.endIndex - 1
            
            controller.pop()
            stack.remove(at: nextIndex)
        }
        
        let nextView = view
            .environment(\.navigator, self)
            .modifier(modifier)
        
        return (AnyView(nextView), controller)
    }
}
