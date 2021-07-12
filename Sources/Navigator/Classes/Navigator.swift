//
//  Navigator.swift
//  Navigation
//
//  Created by dehrom on 08.07.2021.
//

import SwiftUI
import Foundation

public final class Navigator {
    public init(rootNodeController: NavigationNodeController, factory: ModifierFactory.Type) {
        self.rootNodeController = rootNodeController
        self.stack = [rootNodeController]
        self.factory = factory
    }
    
    private var stack: [NavigationNodeController] = []
    private let rootNodeController: NavigationNodeController
    private let factory: ModifierFactory.Type
}

public extension Navigator {
    @discardableResult
    func push<V: View>(_ view: V) -> Int {
        let last = stack.last ?? rootNodeController
        let view = AnyView(view)
        let id = push(view, using: last)
        return id
    }
    
    func pop(by index: Int?) {
        guard
            let index = index,
            stack.indices ~= index
        else { return }
        
        guard index > stack.startIndex else {
            popToRoot()
            return
        }
        
        let previousIndex = index - 1
        pop(by: previousIndex)
    }
    
    func popToRoot() {
        guard let root = stack.first else { return }
        root.pop()
        stack = [root]
    }
}

private extension Navigator {
    func push(_ view: AnyView, using last: NavigationNodeController) -> Int {
        let node = createNewNode(with: view)
        
        last.push(node.view)
        stack.append(node.controller)
        
        return stack.endIndex - 1
    }
    
    func pop(by index: Int) {
        let controller = stack[index]
        controller.pop()
        
        stack.removeSubrange(index..<stack.count)
    }
    
    func createNewNode(with view: AnyView) -> (view: AnyView, controller: NavigationNodeController) {
        let controller = NavigationNodeController()
        let modifier = factory.produce(with: controller) { [self] in
            let index = stack.firstIndex(where: { $0 === controller }) ?? stack.endIndex
            stack.remove(at: index)
        }
        
        let nextView = view
            .environment(\.navigator, self)
            .modifier(modifier)
        
        return (AnyView(nextView), controller)
    }
}
