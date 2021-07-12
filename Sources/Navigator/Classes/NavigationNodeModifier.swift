//
//  NavigationModifier.swift
//  Navigation
//
//  Created by dehrom on 09.07.2021.
//

import Combine
import Foundation
import SwiftUI

struct NavigationNodeModifier: ViewModifier {
    @ObservedObject var controller: NavigationNodeController
    let onAppear: () -> Void
    
    func body(content: Content) -> some View {
        content
            .overlay(
                NavigationLink(
                    destination: controller.nextView,
                    tag: Selection.active,
                    selection: $selection
                ) {}
            )
            .onReceive(controller.$nextView.map { $0 != nil }) {
                selection = Selection($0)
            }
            .onAppear(perform: onAppear)
    }
    
    @State private var selection: Selection? = .inactive
}

private extension NavigationNodeModifier {
    enum Selection: Int {
        case inactive
        case active
        
        init(_ state: Bool) {
            self = state ? .active : .inactive
        }
    }
}
