//
//  UIView+ConstrictorCore.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 26/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

extension UIView {
    
    func constrict(_ selfAttribute: ConstrictorAttribute, relation: NSLayoutRelation = .equal,
                   to item: Constrictable, attribute: ConstrictorAttribute, constant: CGFloat = 0.0,
                   multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) {
        
        let firstItemLayoutAttribute = selfAttribute.itemLayoutAttribute(for: self)
        let secondItemLayoutAttribute = attribute.itemLayoutAttribute(for: item)
        let normalizedConstant = Constant.normalizeConstant(for: firstItemLayoutAttribute.layoutAttribute,
                                                            value: constant)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: self,
                           attribute: firstItemLayoutAttribute.layoutAttribute,
                           relatedBy: relation,
                           toItem: secondItemLayoutAttribute.item,
                           attribute: secondItemLayoutAttribute.layoutAttribute,
                           multiplier: multiplier,
                           constant: normalizedConstant).isActive = true
    }
    
    func constrict(_ selfAttribute: ConstrictorAttribute, relation: NSLayoutRelation = .equal,
                   constant: CGFloat = 0.0, multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) {
        
        let firstItemLayoutAttribute = selfAttribute.itemLayoutAttribute(for: self)
        translatesAutoresizingMaskIntoConstraints = false
        
        let normalizedConstant = Constant.normalizeConstant(for: firstItemLayoutAttribute.layoutAttribute,
                                                            value: constant)
        
        NSLayoutConstraint(item: self,
                           attribute: firstItemLayoutAttribute.layoutAttribute,
                           relatedBy: relation,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: multiplier,
                           constant: normalizedConstant).isActive = true
    }
}
