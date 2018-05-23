//
//  ConstraintIndex.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 23/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

enum ConstraintIndex {
    case first
    case second

    func item(from constraint: NSLayoutConstraint) -> AnyObject? {

        switch self {
        case .first:
            return constraint.firstItem

        case .second:
            return constraint.secondItem
        }
    }
}
