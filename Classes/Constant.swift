//
//  Constant.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 22/05/2018.
//

import Foundation

struct Constant {

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
