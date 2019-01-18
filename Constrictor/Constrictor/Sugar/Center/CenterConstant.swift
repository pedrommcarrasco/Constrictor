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

    let centerX: CGFloat
    let centerY: CGFloat
}

// MARK: - Modifiers
extension CenterConstant {

    public static func centerX(_ value: CGFloat) -> CenterConstant {
        return CenterConstant(centerX: value, centerY: 0)
    }

    public static func centerY(_ value: CGFloat) -> CenterConstant {
        return CenterConstant(centerX: 0, centerY: value)
    }
}

// MARK: - Operator
extension CenterConstant {

    public static func & (lhs: CenterConstant, rhs: CenterConstant) -> CenterConstant {
        return .init(centerX: lhs.centerX + rhs.centerX, centerY: lhs.centerY + rhs.centerY)
    }
}
