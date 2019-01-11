//
//  ConstrictorCenterConstant.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - ConstrictorCenterConstant
public struct ConstrictorCenterConstant: Equatable {

    let x: CGFloat
    let y: CGFloat
}

// MARK: - Internal Custom Initializer
extension ConstrictorCenterConstant {

    init(attribute: ConstrictorCenterAnchor, value: CGFloat) {
        switch attribute {
        case .x: self = .x(value)
        case .y: self = .y(value)
        }
    }
}

// MARK: - Modifiers
extension ConstrictorCenterConstant {

    static func x(_ value: CGFloat) -> ConstrictorCenterConstant {
        return ConstrictorCenterConstant(x: value, y: 0)
    }

    static func y(_ value: CGFloat) -> ConstrictorCenterConstant {
        return ConstrictorCenterConstant(x: 0, y: value)
    }
}

// MARK: - Operator
extension ConstrictorCenterConstant {

    static func & (lhs: ConstrictorCenterConstant, rhs: ConstrictorCenterConstant) -> ConstrictorCenterConstant {
        return .init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}
