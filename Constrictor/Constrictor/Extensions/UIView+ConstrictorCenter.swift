////
////  UIView+ConstrictorCenter.swift
////  Constrictor
////
////  Created by Pedro Carrasco on 21/05/2018.
////  Copyright © 2018 Pedro Carrasco. All rights reserved.
////

import Foundation

public extension UIView {
    
    /**
     Description
     
     - parameters:
     - viewController:
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
    func constrictCenterInViewController(_ viewController: UIViewController, relation: NSLayoutRelation = .equal,
                                        constant: CGFloat = 0.0, multiplier: CGFloat = 1.0,
                                        priority: UILayoutPriority = .required, withinGuides: Bool = true) -> UIView {
        
        constrictCenter(relation, to: viewController, constant: constant,
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
    func constrictCenterInSuperview(_ relation: NSLayoutRelation = .equal, constant: CGFloat = 0.0,
                                   multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required,
                                   withinGuides: Bool = true) -> UIView {
        
        guard let superview = superview else { return self }
        
        constrictCenter(relation, to: superview, constant: constant,
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
    func constrictCenter(_ relation: NSLayoutRelation = .equal, to item: Constrictable,
                                            constant: CGFloat = 0.0, multiplier: CGFloat = 1.0,
                                            priority: UILayoutPriority, withinGuides: Bool = true) -> UIView {
        
        if withinGuides {
            constrict(relation, to: item, attributes: .centerXGuide, .centerYGuide,
                      constant: constant, multiplier: multiplier, priority: priority)
            
        } else {
            constrict(relation, to: item, attributes: .centerX, .centerY,
                      constant: constant, multiplier: multiplier, priority: priority)
        }
        
        return self
    }
}

