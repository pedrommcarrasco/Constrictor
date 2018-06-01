////
////  UIView+ConstrictorEdges.swift
////  Constrictor
////
////  Created by Pedro Carrasco on 21/05/2018.
////  Copyright © 2018 Pedro Carrasco. All rights reserved.
////

import UIKit

public extension UIView {
    
    /**
     Constricts self's edges to viewController's view.
     Use to constrain edges safely to viewController's view.
     
     - parameters:
        - relation: Relation between edges
        - constant: Constraints's constant
        - multiplier: Constraints's multiplier
        - priority: Constraints's priority
        - withinGuides: Bool indicating where to constraint to safeAreas/top and bottom layout guides or not.
     
     - returns:
     Discardable UIView to allow function's chaining.
     */
    
    @discardableResult
    func constrictEdgesToViewController(_ viewController: UIViewController, relation: NSLayoutRelation = .equal,
                                        constant: CGFloat = 0.0, multiplier: CGFloat = 1.0,
                                        priority: UILayoutPriority = .required, withinGuides: Bool = true) -> UIView {
        
        constrictEdges(relation, to: viewController, constant: constant,
                       multiplier: multiplier, priority: priority, withinGuides: withinGuides)
        
        return self
    }
    
    /**
     Constricts self's edges to its superview.
     
     - parameters:
        - relation: Relation between edges
        - constant: Constraints's constant
        - multiplier: Constraints's multiplier
        - priority: Constraints's priority
        - withinGuides: Bool indicating where to constraint to safeAreas/top and bottom layout guides or not.
     
     - returns:
     Discardable UIView to allow function's chaining.
     */
    
    @discardableResult
    func constrictEdgesToSuperview(_ relation: NSLayoutRelation = .equal, constant: CGFloat = 0.0,
                                   multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required,
                                   withinGuides: Bool = true) -> UIView {
        
        guard let superview = superview else { return self }
        
        constrictEdges(relation, to: superview, constant: constant,
                       multiplier: multiplier, priority: priority, withinGuides: withinGuides)
        
        return self
    }
    
    /**
     Constricts self's edges to another Constrictable.
     
     - parameters:
        - relation: Relation between edges
        - item: Constrictable's item to constrict edges with.
        - constant: Constraints's constant
        - multiplier: Constraints's multiplier
        - priority: Constraints's priority
        - withinGuides: Bool indicating where to constraint to safeAreas/top and bottom layout guides or not.
    
     - returns:
     Discardable UIView to allow function's chaining.
     */
    
    @discardableResult
    func constrictEdges(_ relation: NSLayoutRelation = .equal, to item: Constrictable,
                        constant: CGFloat = 0.0, multiplier: CGFloat = 1.0,
                        priority: UILayoutPriority = .required, withinGuides: Bool = true) -> UIView {
        
        if withinGuides {
            constrict(relation, to: item,
                      attributes: .topGuide, .bottomGuide, .leadingGuide, .trailingGuide,
                      multiplier: multiplier, priority: priority)
            
        } else {
            constrict(relation, to: item,
                      attributes: .top, .bottom, .leading, .trailing,
                      multiplier: multiplier, priority: priority)
        }
        
        return self
    }
}
