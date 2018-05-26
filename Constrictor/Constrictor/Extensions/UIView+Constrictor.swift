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
     - guides:
     - relation:
     - constant:
     - multiplier:
     - priority:
     
     - returns:
     Discardable UIView to allow function's chaining.
     */
    @discardableResult func constrictToSuperview(_ guides: Guide ..., relation: NSLayoutRelation = .equal,
                                                 constant: CGFloat = 0.0, multiplier: CGFloat = 1.0,
                                                 priority: UILayoutPriority = .required) -> UIView {
        
        guard let superview = superview else { return self }
        
        guides.forEach {
            switch $0 {
            case .attribute(let attribute), .safe(let attribute):
                self.constrict(attribute, relation: relation, to: Item.v(superview, $0),
                               constant: constant, multiplier: multiplier, priority: priority)
            }
        }
        
        return self
    }
    
    /**
     Description
     
     - parameters:
     - relation:
     - guides:
     - constant:
     - multiplier:
     - priority:
     
     - returns:
     Discardable UIView to allow function's chaining.
     */
    @discardableResult func constrict(_ relation: NSLayoutRelation = .equal,
                                      to items: Item ..., constant: CGFloat = 0.0, multiplier: CGFloat = 1.0,
                                      priority: UILayoutPriority = .required) -> UIView {
        
        items.forEach {
            switch $0 {
            case .vc(_, let guide), .v(_, let guide):
                
                switch guide {
                case .attribute(let attribute), .safe(let attribute):
                    self.constrict(attribute, relation: relation, to: $0,
                                   constant: constant, multiplier: multiplier, priority: priority)
                }
            }
        }
        
        return self
    }
    
    /**
     Description
     
     - parameters:
     - attributes:
     - guides:
     - relation:
     - constant:
     - multiplier:
     - priority:
     
     - returns:
     Discardable UIView to allow function's chaining.
     */
    
    
    
    @discardableResult func constrict(_ selfAttribute: NSLayoutAttribute, relation: NSLayoutRelation = .equal,
                                      to view: UIView? = nil, attribute: ConstrictorAttribute = .none,
                                      constant: CGFloat = 0.0, multiplier: CGFloat = 1.0,
                                      priority: UILayoutPriority = .required) -> UIView {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        guard let view = view else {
            constrict(selfAttribute, relation: relation, constant: constant, multiplier: multiplier, priority: priority)
            return self
        }
        
        constrict(selfAttribute, relation: relation, to: view, attribute: attribute, constant: constant, multiplier: multiplier, priority: priority)
        
        return self
    }
}
