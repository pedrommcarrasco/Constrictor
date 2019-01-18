//
//  SizeConstant.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - SizeConstant
public struct SizeConstant: Equatable {

    let width: CGFloat
    let height: CGFloat
}

// MARK: - Internal Custom Initializer
extension SizeConstant {

    init(size: CGFloat) {
        self = .width(size) & .height(size)
    }
}

// MARK: - Modifiers
extension SizeConstant {

    public static func width(_ value: CGFloat) -> SizeConstant {
        return SizeConstant(width: value, height: 0)
    }

    public static func height(_ value: CGFloat) -> SizeConstant {
        return SizeConstant(width: 0, height: value)
    }
}

// MARK: - Operator
extension SizeConstant {

    public static func & (lhs: SizeConstant, rhs: SizeConstant) -> SizeConstant {

        return .init(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}
