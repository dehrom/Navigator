//
//  NavigationRootView.swift
//  Navigation
//
//  Created by dehrom on 08.07.2021.
//

import Foundation
import SwiftUI

public struct NavigationRootView<Content: View>: View {
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
        rootNodeController = NavigationNodeController()
        factory = ModifierFactory.self
        navigator = Navigator(rootNodeController: rootNodeController, factory: factory)
    }
    
    var body: some View {
        NavigationView {
            content
                .environment(\.navigator, navigator)
                .modifier(
                    factory.produce(with: rootNodeController) {
                        navigator.popToRoot()
                    }
                )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private let content: Content
    private let navigator: Navigator
    private let rootNodeController: NavigationNodeController
    private let factory: ModifierFactory.Type
}
