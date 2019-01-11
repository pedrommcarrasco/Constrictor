//
//  ConstrictorEdgeConstant.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - ConstrictorEdgeConstant
public struct ConstrictorEdgeConstant: Equatable {

    let top: CGFloat
    let bottom: CGFloat
    let leading: CGFloat
    let trailing: CGFloat
}

// MARK: - Internal Custom Initializer
extension ConstrictorEdgeConstant {

    init(attribute: ConstrictorEdgeAnchor, value: CGFloat) {
        switch attribute {
        case .top: self = .top(value)
        case .bottom: self = .bottom(value)
        case .leading: self = .leading(value)
        case .trailing: self = .trailing(value)
        }
    }
}

// MARK: - Modifiers
extension ConstrictorEdgeConstant {

    public static var zero: ConstrictorEdgeConstant {
        return ConstrictorEdgeConstant(top: 0, bottom: 0, leading: 0, trailing: 0)
    }

    public static func top(_ value: CGFloat) -> ConstrictorEdgeConstant {
        return ConstrictorEdgeConstant(top: value, bottom: 0, leading: 0, trailing: 0)
    }

    public static func bottom(_ value: CGFloat) -> ConstrictorEdgeConstant {
        return ConstrictorEdgeConstant(top: 0, bottom: value, leading: 0, trailing: 0)
    }

    public static func leading(_ value: CGFloat) -> ConstrictorEdgeConstant {
        return ConstrictorEdgeConstant(top: 0, bottom: 0, leading: value, trailing: 0)
    }

    public static func trailing(_ value: CGFloat) -> ConstrictorEdgeConstant {
        return ConstrictorEdgeConstant(top: 0, bottom: 0, leading: value, trailing: 0)
    }

    public static func vertical(_ value: CGFloat) -> ConstrictorEdgeConstant {
        return ConstrictorEdgeConstant(top: value, bottom: value, leading: 0, trailing: 0)
    }

    public static func horizontal(_ value: CGFloat) -> ConstrictorEdgeConstant {
        return ConstrictorEdgeConstant(top: 0, bottom: 0, leading: value, trailing: value)
    }

    static func all(_ value: CGFloat) -> ConstrictorEdgeConstant {
        return ConstrictorEdgeConstant(top: value, bottom: value, leading: value, trailing: value)
    }
}

// MARK: - Operator
extension ConstrictorEdgeConstant {

    static func & (lhs: ConstrictorEdgeConstant, rhs: ConstrictorEdgeConstant) -> ConstrictorEdgeConstant {
        return .init(top: lhs.top + lhs.top,
                     bottom: lhs.bottom + lhs.bottom,
                     leading: lhs.leading + lhs.leading,
                     trailing: lhs.trailing + lhs.trailing)
    }
}
