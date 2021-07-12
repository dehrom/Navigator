//
//  NavigatorExampleApp.swift
//  NavigatorExample
//
//  Created by dehrom on 12.07.2021.
//

import SwiftUI
import Navigator

@main
struct NavigatorExampleApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationRootView {
                Page0View()
            }
        }
    }
}
