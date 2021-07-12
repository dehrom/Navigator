//
//  NavigationNode.swift
//  Navigation
//
//  Created by dehrom on 09.07.2021.
//

import Foundation
import SwiftUI

final class NavigationNodeController: ObservableObject {
    let id: NavigationIdentifier
    @Published private (set) var nextView: AnyView? = nil
    
    init(with id: NavigationIdentifier) {
        self.id = id
    }
    
    func push<V: View>(_ view: V) {
        nextView = AnyView(view)
    }
    
    func pop() {
        nextView = nil
    }
}
