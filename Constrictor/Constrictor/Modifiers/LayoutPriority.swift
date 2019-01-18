//
//  LayoutPriority.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 15/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - LayoutPriority
public struct LayoutPriority: Equatable {

    // MARK: Properties
    let value: Float

    // MARK: Init
    public init(_ rawValue: Float) {
        self.value = rawValue
    }
}

// MARK: - Conversion
extension LayoutPriority {

    func nativeValue() -> UILayoutPriority {
        return UILayoutPriority(value)
    }
}

// MARK: - Standard
extension LayoutPriority {

    public static let required = LayoutPriority(1000)
    public static let high = LayoutPriority(750)
    public static let low = LayoutPriority(250)
    public static let fit = LayoutPriority(50)
}

// MARK: - Operators
public extension LayoutPriority {

    public static func +(lhs: LayoutPriority, rhs: Float) -> LayoutPriority {
        return LayoutPriority(lhs.value + rhs)
    }

    public static func -(lhs: LayoutPriority, rhs: Float) -> LayoutPriority {
        return LayoutPriority(lhs.value - rhs)
    }
}
