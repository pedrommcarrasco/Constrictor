//
//  UIView+Constrictor.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 21/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

public extension UIView {
    
    @discardableResult func constrictToContainer(_ selfAttribute: NSLayoutAttribute,
                                                 relation: NSLayoutRelation = .equal,
                                                 attribute: NSLayoutAttribute = .notAnAttribute,
                                                 constant: CGFloat = 0.0,
                                                 multipler: CGFloat = 1.0,
                                                 priority: UILayoutPriority = .required) -> UIView {
        
        constrict(selfAttribute,
                  relation: relation,
                  to: superview,
                  attribute: attribute,
                  constant: constant,
                  multipler: multipler,
                  priority: priority)
        
        return self
    }
    
    @discardableResult func constrict(_ selfAttribute: NSLayoutAttribute,
                                      relation: NSLayoutRelation = .equal,
                                      to view: UIView? = nil,
                                      attribute: NSLayoutAttribute = .notAnAttribute,
                                      constant: CGFloat = 0.0,
                                      multipler: CGFloat = 1.0,
                                      priority: UILayoutPriority = .required) -> UIView {
        
        NSLayoutConstraint(item: self,
                           attribute: selfAttribute,
                           relatedBy: relation,
                           toItem: view,
                           attribute: attribute,
                           multiplier: multipler,
                           constant: constant).isActive = true
        
        return self
    }
    
    @discardableResult func constrict(_ attributes: NSLayoutAttribute ...,
                                      relation: NSLayoutRelation = .equal,
                                      to view: UIView? = nil,
                                      constant: CGFloat = 0.0,
                                      multipler: CGFloat = 1.0,
                                      priority: UILayoutPriority = .required) -> UIView {
        
        attributes.forEach {
            NSLayoutConstraint(item: self,
                               attribute: $0,
                               relatedBy: relation,
                               toItem: view,
                               attribute: $0,
                               multiplier: multipler,
                               constant: constant).isActive = true
        }
        
        return self
    }
}
