//
//  NodeFactory.swift
//  Navigation
//
//  Created by dehrom on 11.07.2021.
//

import Foundation
import SwiftUI

enum ModifierFactory {
    static func produce(
        with controller: NavigationNodeController,
        _ callback: @escaping () -> Void
    ) -> NavigationNodeModifier {
        let weakBox = WeakBox(controller)
        return NavigationNodeModifier(controller: weakBox) {
            if weakBox.wrappedValue?.nextView != nil {
                weakBox.nullify()
                callback()
            }
        }
    }
}
