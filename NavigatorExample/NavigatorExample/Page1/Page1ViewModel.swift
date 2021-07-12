//
//  Page1ViewModel.swift
//  NavigatorExample
//
//  Created by dehrom on 12.07.2021.
//

import SwiftUI
import Foundation

final class Page1ViewModel: ObservableObject {
    @Published var nextView: Page2View? = nil
    
    func moveForward() {
        nextView = Page2View()
    }
}
