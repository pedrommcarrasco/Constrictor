//
//  UIView+ConstrictorCore.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 26/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

extension UIView {
    
    func constrict(_ selfAttribute: NSLayoutAttribute, relation: NSLayoutRelation = .equal,
                   to viewController: UIViewController, attribute: ConstrictorAttribute, constant: CGFloat = 0.0,
                   multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) {
        
        
        let itemLayoutAttribute = attribute.itemLayoutAttribute(for: viewController)
        
        NSLayoutConstraint(item: self,
                           attribute: selfAttribute,
                           relatedBy: relation,
                           toItem: itemLayoutAttribute.item,
                           attribute: itemLayoutAttribute.layoutAttribute,
                           multiplier: multiplier,
                           constant: constant).isActive = true
    }
    
    func constrict(_ selfAttribute: NSLayoutAttribute, relation: NSLayoutRelation = .equal,
                   to view: UIView, attribute: ConstrictorAttribute, constant: CGFloat = 0.0,
                   multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) {
        
        
        let itemLayoutAttribute = attribute.itemLayoutAttribute(for: view)
        
        NSLayoutConstraint(item: self,
                           attribute: selfAttribute,
                           relatedBy: relation,
                           toItem: itemLayoutAttribute.item,
                           attribute: itemLayoutAttribute.layoutAttribute,
                           multiplier: multiplier,
                           constant: constant).isActive = true
    }
    
    func constrict(_ selfAttribute: NSLayoutAttribute, relation: NSLayoutRelation = .equal,
                   constant: CGFloat = 0.0, multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) {
        
        NSLayoutConstraint(item: self,
                           attribute: selfAttribute,
                           relatedBy: relation,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: multiplier,
                           constant: constant).isActive = true
    }
}
