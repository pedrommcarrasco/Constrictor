//
//  ConstrictorSizeConstant.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - ConstrictorSizeConstant
public struct ConstrictorSizeConstant: Equatable {

    let width: CGFloat
    let height: CGFloat
}

// MARK: - Internal Custom Initializer
extension ConstrictorSizeConstant {

    init(attribute: ConstrictorSizeAnchor, value: CGFloat) {

        switch attribute {
        case .width: self = .width(value)
        case .height: self = .height(value)
        }
    }

    init(size: CGFloat) {
        self = .width(size) & .height(size)
    }
}

// MARK: - Modifiers
extension ConstrictorSizeConstant {

    static func width(_ value: CGFloat) -> ConstrictorSizeConstant {
        return ConstrictorSizeConstant(width: value, height: 0)
    }

    static func height(_ value: CGFloat) -> ConstrictorSizeConstant {
        return ConstrictorSizeConstant(width: 0, height: value)
    }
}

// MARK: - Operator
extension ConstrictorSizeConstant {

    static func & (lhs: ConstrictorSizeConstant, rhs: ConstrictorSizeConstant) -> ConstrictorSizeConstant {

        return .init(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}
