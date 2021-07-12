//
//  Page0ViewModel.swift
//  NavigatorExample
//
//  Created by dehrom on 12.07.2021.
//

import SwiftUI
import Foundation

final class Page0ViewModel: ObservableObject {
    @Published var nextView: Page1View? = nil
    
    func moveForward() {
        nextView = Page1View()
    }
}
