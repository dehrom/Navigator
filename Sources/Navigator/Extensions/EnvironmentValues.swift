//
//  EnvironmentValues.swift
//  Navigation
//
//  Created by dehrom on 09.07.2021.
//

import Foundation
import SwiftUI

public extension EnvironmentValues {
    private struct NavigatorEnvironmentKey: EnvironmentKey {
        static var defaultValue: Navigator? { nil }
    }

    public var navigator: Navigator? {
        get {
            self[NavigatorEnvironmentKey.self]
        } set {
            self[NavigatorEnvironmentKey.self] = newValue
        }
    }
}
