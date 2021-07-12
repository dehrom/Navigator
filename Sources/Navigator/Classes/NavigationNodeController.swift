//
//  NavigationNode.swift
//  Navigation
//
//  Created by dehrom on 09.07.2021.
//

import Foundation
import SwiftUI

final class NavigationNodeController: ObservableObject {
    @Published private (set) var nextView: AnyView? = nil
    
    func push<V: View>(_ view: V) {
        nextView = AnyView(view)
    }
    
    func pop() {
        nextView = nil
    }
}
