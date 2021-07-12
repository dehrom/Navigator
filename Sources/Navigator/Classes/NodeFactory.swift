//
//  NodeFactory.swift
//  Navigation
//
//  Created by dehrom on 11.07.2021.
//

import Foundation
import SwiftUI

final class ModifierFactory {
    func produce(
        with controller: NavigationNodeController,
        _ callback: @escaping () -> Void
    ) -> NavigationNodeModifier {
        return NavigationNodeModifier(controller: controller) { [unowned controller] in
            if controller.nextView != nil {
                callback()
            }
        }
    }
}
