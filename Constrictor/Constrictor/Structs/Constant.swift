//
//  Constant.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 22/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

struct Constant {

    /**
     Inverts the constant/offset sent depending on the NSLayoutAttribute.

     - parameters:
        - attribute: NSLayoutAttribute where the constant will be applied.
        - value: Constant's value.

     - returns:
     CGFloat containing the constant final value.
     */
    
    static func normalizeConstant(for attribute: NSLayoutAttribute, value: CGFloat) -> CGFloat {

        switch attribute {
        case .trailing, .bottom, .right,
             .trailingMargin, .bottomMargin, .rightMargin,
             .firstBaseline, .lastBaseline:
            return -value

        case .left, .top, .leading,
             .height, .width,
             .centerY, .centerX,
             .leftMargin, .topMargin, .leadingMargin,
             .centerXWithinMargins, .centerYWithinMargins,
             .notAnAttribute:
            return value
        }
    }
}
