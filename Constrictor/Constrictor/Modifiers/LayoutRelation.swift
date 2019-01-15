//
//  LayoutRelation.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 15/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - LayoutRelation
public enum LayoutRelation {
    case lessOrEqual
    case equal
    case greaterOrEqual
}

// MARK: - Conversion
extension LayoutRelation {

    func nativeValue() -> NSLayoutConstraint.Relation {
        switch self {
        case .lessOrEqual: return .lessThanOrEqual
        case .equal: return .equal
        case .greaterOrEqual: return .greaterThanOrEqual
        }
    }
}
