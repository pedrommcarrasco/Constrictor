//
//  ConstrictorFactory.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

struct ConstrictorAssembler {
    
    // MARK: Prepare Anchorable
    static func configure(_ anchorable: Anchorable) {
        guard let view = anchorable as? UIView, !view.translatesAutoresizingMaskIntoConstraints else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: Constraint Factory
    static func constrict(anchorA: NSLayoutXAxisAnchor,
                          anchorB: NSLayoutXAxisAnchor,
                          relation: NSLayoutConstraint.Relation,
                          constant: CGFloat,
                          priority: UILayoutPriority,
                          isActive: Bool) {

        let constraint: NSLayoutConstraint

        switch relation {
        case .lessThanOrEqual: constraint = anchorA.constraint(lessThanOrEqualTo: anchorB)
        case .equal: constraint = anchorA.constraint(equalTo: anchorB)
        case .greaterThanOrEqual: constraint = anchorA.constraint(greaterThanOrEqualTo: anchorB)
        }

        constraint.set(constant: constant, priority: priority, isActive: isActive)
    }

    static func constrict(anchorA: NSLayoutYAxisAnchor,
                          anchorB: NSLayoutYAxisAnchor,
                          relation: NSLayoutConstraint.Relation,
                          constant: CGFloat,
                          priority: UILayoutPriority,
                          isActive: Bool) {

        let constraint: NSLayoutConstraint

        switch relation {
        case .lessThanOrEqual: constraint = anchorA.constraint(lessThanOrEqualTo: anchorB)
        case .equal: constraint = anchorA.constraint(equalTo: anchorB)
        case .greaterThanOrEqual: constraint = anchorA.constraint(greaterThanOrEqualTo: anchorB)
        }

        constraint.set(constant: constant, priority: priority, isActive: isActive)
    }

    static func constrict(anchorA: NSLayoutDimension,
                          anchorB: NSLayoutDimension,
                          relation: NSLayoutConstraint.Relation,
                          constant: CGFloat,
                          multiplier: CGFloat,
                          priority: UILayoutPriority,
                          isActive: Bool) {

        let constraint: NSLayoutConstraint

        switch relation {
        case .lessThanOrEqual: constraint = anchorA.constraint(lessThanOrEqualTo: anchorB, multiplier: multiplier)
        case .equal: constraint = anchorA.constraint(equalTo: anchorB, multiplier: multiplier)
        case .greaterThanOrEqual: constraint = anchorA.constraint(greaterThanOrEqualTo: anchorB, multiplier: multiplier)
        }

        constraint.set(constant: constant, priority: priority, isActive: isActive)
    }

    static func constrict(anchor: NSLayoutDimension,
                          relation: NSLayoutConstraint.Relation,
                          constant: CGFloat,
                          priority: UILayoutPriority,
                          isActive: Bool) {

        let constraint: NSLayoutConstraint

        switch relation {
        case .lessThanOrEqual: constraint = anchor.constraint(equalToConstant: constant)
        case .equal: constraint = anchor.constraint(greaterThanOrEqualToConstant: constant)
        case .greaterThanOrEqual: constraint = anchor.constraint(lessThanOrEqualToConstant: constant)
        }

        constraint.set(constant: constant, priority: priority, isActive: isActive)
    }
}
