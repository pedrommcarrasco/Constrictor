//
//  ConstrictorEdgeConstant.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - EdgeConstant
public struct EdgeConstant: Equatable {
    
    let top: CGFloat
    let bottom: CGFloat
    let leading: CGFloat
    let trailing: CGFloat
}

// MARK: - Modifiers
extension EdgeConstant {
    
    public static var zero: EdgeConstant {
        return EdgeConstant(top: 0, bottom: 0, leading: 0, trailing: 0)
    }
    
    public static func top(_ value: CGFloat) -> EdgeConstant {
        return EdgeConstant(top: value, bottom: 0, leading: 0, trailing: 0)
    }
    
    public static func bottom(_ value: CGFloat) -> EdgeConstant {
        return EdgeConstant(top: 0, bottom: -value, leading: 0, trailing: 0)
    }
    
    public static func leading(_ value: CGFloat) -> EdgeConstant {
        return EdgeConstant(top: 0, bottom: 0, leading: value, trailing: 0)
    }
    
    public static func trailing(_ value: CGFloat) -> EdgeConstant {
        return EdgeConstant(top: 0, bottom: 0, leading: 0, trailing: -value)
    }
    
    public static func vertical(_ value: CGFloat) -> EdgeConstant {
        return EdgeConstant(top: value, bottom: -value, leading: 0, trailing: 0)
    }
    
    public static func horizontal(_ value: CGFloat) -> EdgeConstant {
        return EdgeConstant(top: 0, bottom: 0, leading: value, trailing: -value)
    }
    
    static func all(_ value: CGFloat) -> EdgeConstant {
        return EdgeConstant(top: value, bottom: -value, leading: value, trailing: -value)
    }
}

// MARK: - Operator
extension EdgeConstant {
    
    public static func & (lhs: EdgeConstant, rhs: EdgeConstant) -> EdgeConstant {
        return .init(top: lhs.top + rhs.top,
                     bottom: lhs.bottom + rhs.bottom,
                     leading: lhs.leading + rhs.leading,
                     trailing: lhs.trailing + rhs.trailing)
    }
}
