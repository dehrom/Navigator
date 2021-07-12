//
//  WeakBox.swift
//  Navigation
//
//  Created by dehrom on 11.07.2021.
//

import Foundation

final class WeakBox<T: AnyObject> {
    weak var wrappedValue: T?
    
    init(_ wrappedValue: T? = nil) {
        self.wrappedValue = wrappedValue
    }
    
    func nullify() {
        wrappedValue = nil
    }
}
