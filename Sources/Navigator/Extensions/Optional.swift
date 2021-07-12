//
//  Optional.swift
//  Navigation
//
//  Created by dehrom on 11.07.2021.
//

import Combine
import Foundation

extension Optional {
    func toPublisher() -> AnyPublisher<Wrapped, Never> {
        if #available(iOS 14.0, *) {
            return publisher.eraseToAnyPublisher()
        } else {
            switch self {
            case let value?:
                return Just(value).eraseToAnyPublisher()
            case _:
                return Empty().eraseToAnyPublisher()
            }
        }
    }
}
