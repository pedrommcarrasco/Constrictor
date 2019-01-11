//
//  CenterConstant.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - CenterConstant
public struct CenterConstant: Equatable {

    let x: CGFloat
    let y: CGFloat
}

// MARK: - Internal Custom Initializer
extension CenterConstant {

    init(attribute: CenterAnchor, value: CGFloat) {
        switch attribute {
        case .x: self = .x(value)
        case .y: self = .y(value)
        }
    }
}

// MARK: - Modifiers
extension CenterConstant {

    static func x(_ value: CGFloat) -> CenterConstant {
        return CenterConstant(x: value, y: 0)
    }

    static func y(_ value: CGFloat) -> CenterConstant {
        return CenterConstant(x: 0, y: value)
    }
}

// MARK: - Operator
extension CenterConstant {

    static func & (lhs: CenterConstant, rhs: CenterConstant) -> CenterConstant {
        return .init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}
