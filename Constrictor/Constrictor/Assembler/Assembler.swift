//
//  Assembler.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

struct Assembler {
    
    // MARK: Prepare Anchorable
    static func configure(_ anchorable: Anchorable) {
        guard let view = anchorable as? UIView, view.translatesAutoresizingMaskIntoConstraints else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: Constraint Factory
    static func constrict(anchorA: NSLayoutXAxisAnchor,
                          anchorB: NSLayoutXAxisAnchor,
                          relation: LayoutRelation,
                          constant: CGFloat,
                          priority: LayoutPriority,
                          state: LayoutState) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        
        switch relation {
        case .lessOrEqual: constraint = anchorA.constraint(lessThanOrEqualTo: anchorB)
        case .equal: constraint = anchorA.constraint(equalTo: anchorB)
        case .greaterOrEqual: constraint = anchorA.constraint(greaterThanOrEqualTo: anchorB)
        }
        
        constraint.set(constant: constant, priority: priority, state: state)
        
        return constraint
    }
    
    static func constrict(anchorA: NSLayoutYAxisAnchor,
                          anchorB: NSLayoutYAxisAnchor,
                          relation: LayoutRelation,
                          constant: CGFloat,
                          priority: LayoutPriority,
                          state: LayoutState) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        
        switch relation {
        case .lessOrEqual: constraint = anchorA.constraint(lessThanOrEqualTo: anchorB)
        case .equal: constraint = anchorA.constraint(equalTo: anchorB)
        case .greaterOrEqual: constraint = anchorA.constraint(greaterThanOrEqualTo: anchorB)
        }
        
        constraint.set(constant: constant, priority: priority, state: state)
        
        return constraint
    }
    
    static func constrict(anchorA: NSLayoutDimension,
                          anchorB: NSLayoutDimension,
                          relation: LayoutRelation,
                          constant: CGFloat,
                          multiplier: CGFloat,
                          priority: LayoutPriority,
                          state: LayoutState) -> NSLayoutConstraint{
        
        let constraint: NSLayoutConstraint
        
        switch relation {
        case .lessOrEqual: constraint = anchorA.constraint(lessThanOrEqualTo: anchorB, multiplier: multiplier)
        case .equal: constraint = anchorA.constraint(equalTo: anchorB, multiplier: multiplier)
        case .greaterOrEqual: constraint = anchorA.constraint(greaterThanOrEqualTo: anchorB, multiplier: multiplier)
        }
        
        constraint.set(constant: constant, priority: priority, state: state)
        
        return constraint
    }
    
    static func constrict(anchor: NSLayoutDimension,
                          relation: LayoutRelation,
                          constant: CGFloat,
                          priority: LayoutPriority,
                          state: LayoutState) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        
        switch relation {
        case .lessOrEqual: constraint = anchor.constraint(greaterThanOrEqualToConstant: constant)
        case .equal: constraint = anchor.constraint(equalToConstant: constant)
        case .greaterOrEqual: constraint = anchor.constraint(lessThanOrEqualToConstant: constant)
        }
        
        constraint.set(constant: constant, priority: priority, state: state)
        
        return constraint
    }
}
