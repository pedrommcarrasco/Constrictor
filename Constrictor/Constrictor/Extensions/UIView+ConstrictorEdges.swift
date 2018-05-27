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
     Description
     
     - parameters:
     - relation:
     - constant:
     - constant:
     - multiplier:
     - priority:
     - withinGuides:
     
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
     Description
     
     - parameters:
     - relation:
     - constant:
     - constant:
     - multiplier:
     - priority:
     - withinGuides:
     
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
     Description
     
     - parameters:
     - relation:
     - item:
     - constant:
     - multiplier:
     - priority:
     - withinGuides:
     
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
