//
//  UILayoutPriority+Operators.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 14/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

extension UILayoutPriority {
    static func +(lhs: UILayoutPriority, rhs: Float) -> UILayoutPriority {
        return UILayoutPriority(lhs.rawValue + rhs)
    }

    static func -(lhs: UILayoutPriority, rhs: Float) -> UILayoutPriority {
        return UILayoutPriority(lhs.rawValue - rhs)
    }
}
