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

    func item(from constraint: NSLayoutConstraint) -> UIView? {

        let item: AnyObject?

        switch self {
        case .first:
            item =  constraint.firstItem

        case .second:
            item = constraint.secondItem
        }

        return item as? UIView
    }
}
