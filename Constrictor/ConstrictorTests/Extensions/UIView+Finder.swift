//
//  UIView+Finder.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 23/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

extension UIView {

    func findConstraints(for attribute: NSLayoutConstraint.Attribute,
                         relatedTo view: UIView? = nil,
                         at index: ConstraintIndex = .firstItem) -> [NSLayoutConstraint] {

        return constraints.compactMap { constraint -> NSLayoutConstraint? in
            if constraint.isFrom(attribute, relatedTo: view, at: index) { return constraint }
            else { return nil }
        }
    }
}
