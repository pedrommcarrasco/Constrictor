////
////  Constrictable+ConstrictorCenter.swift
////  Constrictor
////
////  Created by Pedro Carrasco on 21/05/2018.
////  Copyright © 2018 Pedro Carrasco. All rights reserved.
////

import Foundation

// MARK: - ConstrictorCenter
public extension Constrictable {
    
    /**
     Constricts self's center to viewController's view.
     Use to constrain center safely to viewController's view
     
     - parameters:
     - relation: Relation between center
     - constant: Constraints's constant
     - multiplier: Constraints's multiplier
     - priority: Constraints's priority
     - withinGuides: Bool indicating where to constraint to safeAreas/top and bottom layout guides or not.
     
     - returns:
     Discardable UIView to allow function's chaining.
     */
    
    @discardableResult
    func constrictCenterInController(_ viewController: UIViewController,
                                     as relation: NSLayoutRelation = .equal,
                                     with constant: Constant = .zero,
                                     multiplyBy multiplier: CGFloat = 1.0,
                                     prioritizeAs priority: UILayoutPriority = .required,
                                     withinGuides: Bool = true) -> Self {
        
        constrictCenter(as: relation, to: viewController, with: constant,
                        multiplyBy: multiplier, prioritizeAs: priority, withinGuides: withinGuides)
        
        return self
    }
    
    /**
     Constricts self's center to another Constrictable.
     
     - parameters:
     - relation: Relation between center
     - item: Constrictable's item to constrict center with.
     - constant: Constraints's constant
     - multiplier: Constraints's multiplier
     - priority: Constraints's priority
     - withinGuides: Bool indicating where to constraint to safeAreas/top and bottom layout guides or not.
     
     - returns:
     Discardable UIView to allow function's chaining.
     */
    
    @discardableResult
    func constrictCenter(as relation: NSLayoutRelation = .equal,
                         to item: Constrictable,
                         with constant: Constant = .zero,
                         multiplyBy multiplier: CGFloat = 1.0,
                         prioritizeAs priority: UILayoutPriority = .required,
                         withinGuides: Bool = true) -> Self {
        
        if withinGuides {
            constrict(as: relation, to: item, attributes: .centerXGuide, .centerYGuide,
                      with: constant, multiplyBy: multiplier, prioritizeAs: priority)
            
        } else {
            constrict(as: relation, to: item, attributes: .centerX, .centerY,
                      with: constant, multiplyBy: multiplier, prioritizeAs: priority)
            
        }
        
        return self
    }
}

// MARK: - ConstrictorCenter (UIView)
public extension Constrictable where Self: UIView {
    
    /**
     Constricts self's center to its superview.
     
     - parameters:
     - relation: Relation between center
     - constant: Constraints's constant
     - multiplier: Constraints's multiplier
     - priority: Constraints's priority
     - withinGuides: Bool indicating where to constraint to safeAreas/top and bottom layout guides or not.
     
     - returns:
     Discardable UIView to allow function's chaining.
     */
    
    @discardableResult
    func constrictCenterInParent(as relation: NSLayoutRelation = .equal,
                                 with constant: Constant = .zero,
                                 multiplyBy multiplier: CGFloat = 1.0,
                                 prioritizeAs priority: UILayoutPriority = .required,
                                 withinGuides: Bool = true) -> UIView {
        
        guard let superview = superview else { return self }
        
        constrictCenter(as: relation, to: superview, with: constant,
                        multiplyBy: multiplier, prioritizeAs: priority, withinGuides: withinGuides)
        
        return self
    }
}

