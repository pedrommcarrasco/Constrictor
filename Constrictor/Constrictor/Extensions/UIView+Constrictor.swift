//
//  UIView+Constrictor.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 21/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

public extension UIView {
    
    /**
     Description
     
     - parameters:
     - viewController:
     - relation:
     - attributes:
     - constant:
     - multiplier:
     - priority:
     
     - returns:
     Discardable UIView to allow function's chaining.
     */
    
    @discardableResult
    func constrictToViewController(_ viewController: UIViewController, relation: NSLayoutRelation = .equal,
                                   attributes: ConstrictorAttribute ..., constant: CGFloat = 0.0,
                                   multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) -> UIView {
        
        attributes.forEach {
            self.constrict($0, relation: relation, to: viewController, attribute: $0,
                           constant: constant, multiplier: multiplier, priority: priority)
        }
        
        return self
    }
    
    /**
     Description
     
     - parameters:
     - relation:
     - item:
     - attributes:
     - constant:
     - multiplier:
     - priority:
     
     - returns:
     Discardable UIView to allow function's chaining.
     */
    
    @discardableResult
    func constrictToSuperview(_ relation: NSLayoutRelation = .equal,
                              attributes: ConstrictorAttribute ..., constant: CGFloat = 0.0,
                              multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) -> UIView {
        
        attributes.forEach {
            self.constrict($0, relation: relation, to: self.superview, attribute: $0,
                           constant: constant, multiplier: multiplier, priority: priority)
        }
        
        return self
    }
    
    /**
     Description
     
     - parameters:
     - relation:
     - item:
     - attributes:
     - constant:
     - multiplier:
     - priority:
     
     - returns:
     Discardable UIView to allow function's chaining.
     */
    
    @discardableResult
    func constrict(_ relation: NSLayoutRelation = .equal, to item: Constrictable? = nil,
                   attributes: ConstrictorAttribute ..., constant: CGFloat = 0.0,
                   multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) -> UIView {
        
        attributes.forEach {
            self.constrict($0, relation: relation, to: item, attribute: $0,
                           constant: constant, multiplier: multiplier, priority: priority)
        }
        
        return self
    }
    
    /**
     Description
     
     - parameters:
     - selfAttribute:
     - relation:
     - item:
     - attribute:
     - constant:
     - multiplier:
     - priority:
     
     - returns:
     Discardable UIView to allow function's chaining.
     */
    
    @discardableResult
    func constrict(_ selfAttribute: ConstrictorAttribute, relation: NSLayoutRelation = .equal,
                   to item: Constrictable? = nil, attribute: ConstrictorAttribute = .none,
                   constant: CGFloat = 0.0, multiplier: CGFloat = 1.0,
                   priority: UILayoutPriority = .required) -> UIView {
        
        guard let item = item else {
            constrict(selfAttribute, relation: relation, constant: constant, multiplier: multiplier, priority: priority)
            return self
        }
        
        constrict(selfAttribute, relation: relation, to: item, attribute: attribute, constant: constant, multiplier: multiplier, priority: priority)
        
        return self
    }
}
