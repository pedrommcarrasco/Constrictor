//
//  Constant.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 22/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

//
//  Constant.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 22/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - Constant
public struct Constant {
    
    let x: CGFloat
    let y: CGFloat
    let top: CGFloat
    let bottom: CGFloat
    let right: CGFloat
    let left: CGFloat
    let leading: CGFloat
    let trailing: CGFloat
    let width: CGFloat
    let height: CGFloat
}

// MARK: - Modifiers
public extension Constant {
    
    static func x(_ value: CGFloat) -> Constant {
        return Constant(x: value, y: 0.0,
                        top: 0.0, bottom: 0.0,
                        right: 0.0, left: 0.0,
                        leading: 0.0, trailing: 0.0,
                        width: 0.0, height: 0.0)
    }
    
    static func y(_ value: CGFloat) -> Constant {
        return Constant(x: 0.0, y: value,
                        top: 0.0, bottom: 0.0,
                        right: 0.0, left: 0.0,
                        leading: 0.0, trailing: 0.0,
                        width: 0.0, height: 0.0)
    }
    
    static func top(_ value: CGFloat) -> Constant {
        return Constant(x: 0.0, y: value,
                        top: value, bottom: 0.0,
                        right: 0.0, left: 0.0,
                        leading: 0.0, trailing: 0.0,
                        width: 0.0, height: 0.0)
    }
    
    static func bottom(_ value: CGFloat) -> Constant {
        return Constant(x: 0.0, y: value,
                        top: 0.0, bottom: value,
                        right: 0.0, left: 0.0,
                        leading: 0.0, trailing: 0.0,
                        width: 0.0, height: 0.0)
    }
    
    static func leading(_ value: CGFloat) -> Constant {
        return Constant(x: 0.0, y: value,
                        top: 0.0, bottom: 0.0,
                        right: 0.0, left: 0.0,
                        leading: value, trailing: 0.0,
                        width: 0.0, height: 0.0)
    }
    
    static func trailing(_ value: CGFloat) -> Constant {
        return Constant(x: 0.0, y: value,
                        top: 0.0, bottom: 0.0,
                        right: 0.0, left: 0.0,
                        leading: 0.0, trailing: value,
                        width: 0.0, height: 0.0)
    }
    
    static func right(_ value: CGFloat) -> Constant {
        return Constant(x: 0.0, y: value,
                        top: 0.0, bottom: 0.0,
                        right: value, left: 0.0,
                        leading: 0.0, trailing: 0.0,
                        width: 0.0, height: 0.0)
    }
    
    static func left(_ value: CGFloat) -> Constant {
        return Constant(x: 0.0, y: value,
                        top: 0.0, bottom: 0.0,
                        right: 0.0, left: value,
                        leading: 0.0, trailing: 0.0,
                        width: 0.0, height: 0.0)
    }
    
    static func width(_ value: CGFloat) -> Constant {
        return Constant(x: 0.0, y: 0.0,
                        top: 0.0, bottom: 0.0,
                        right: value, left: 0.0,
                        leading: 0.0, trailing: 0.0,
                        width: value, height: 0.0)
    }
    
    static func height(_ value: CGFloat) -> Constant {
        return Constant(x: 0.0, y: 0.0,
                        top: 0.0, bottom: 0.0,
                        right: 0.0, left: value,
                        leading: 0.0, trailing: 0.0,
                        width: 0.0, height: value)
    }
    
    static let zero = Constant(x: 0.0, y: 0.0,
                               top: 0.0, bottom: 0.0,
                               right: 0.0, left: 0.0,
                               leading: 0.0, trailing: 0.0,
                               width: 0.0, height: 0.0)
}

// MARK: - Operator
public extension Constant {
    
    static func & (lhs: Constant, rhs: Constant) -> Constant {
        
        return .init(x: lhs.x + rhs.x, y: lhs.y + rhs.y,
                     top: lhs.top + rhs.top, bottom: lhs.bottom + rhs.bottom,
                     right: lhs.right + rhs.right, left: lhs.left + rhs.left,
                     leading: lhs.leading + rhs.leading, trailing: lhs.trailing + rhs.trailing,
                     width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}
