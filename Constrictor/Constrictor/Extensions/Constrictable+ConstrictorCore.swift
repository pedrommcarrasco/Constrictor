//
//  Constrictable+ConstrictorCore.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 26/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

extension Constrictable {
    
    /**
     Internal Constrictor's core method.
     Applies a constraint between two Constrictable items.
     
     - parameters:
        - selfAttribute: Self's item layout attribute
        - relation: Relation between both attributes
        - item: Constrictable's item to apply a constraint with.
        - attribute: Item's layout attribute to constraint with.
        - constant: Constraint's constant
        - multiplier: Constraint's multiplier
        - priority: Constraint's priority
     
     This method's responsible for abstracting and invoking methods responsible of converting ConstrictorAttribute to
     NSLayoutAttribute and normalizing the constant based on the selfAttribute
     */
    
    func constrict(_ selfAttribute: ConstrictorAttribute, relation: NSLayoutRelation = .equal,
                   to item: Constrictable, attribute: ConstrictorAttribute, constant: Constant,
                   multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) {
        
        let firstItemLayoutAttribute = selfAttribute.itemLayoutAttribute(for: self, with: constant)
        let secondItemLayoutAttribute = attribute.itemLayoutAttribute(for: item, with: constant)

        if let constrictableAsView = self as? UIView {

            constrictableAsView.translatesAutoresizingMaskIntoConstraints = false
        }

        
        NSLayoutConstraint(item: self,
                           attribute: firstItemLayoutAttribute.layoutAttribute,
                           relatedBy: relation,
                           toItem: secondItemLayoutAttribute.item,
                           attribute: secondItemLayoutAttribute.layoutAttribute,
                           multiplier: multiplier,
                           constant: firstItemLayoutAttribute.constant).isActive = true
    }
    
    /**
     Internal Constrictor's core method.
     Applies a constraint to itself.
     
     - parameters:
        - selfAttribute: Self's item layout attribute
        - relation: Relation between constraint and constant
        - constant: Constraint's constant
        - multiplier: Constraint's multiplier
        - priority: Constraint's priority
     
     This method's responsible for abstracting and invoking methods responsible of converting ConstrictorAttribute to
     NSLayoutAttribute and normalizing the constant based on the selfAttribute
     */
    
    func constrict(_ selfAttribute: ConstrictorAttribute, relation: NSLayoutRelation = .equal,
                   constant: Constant, multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) {
        
        let layoutAttributes = selfAttribute.itemLayoutAttribute(for: self, with: constant)

        if let constrictableAsView = self as? UIView {

            constrictableAsView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint(item: self,
                           attribute: layoutAttributes.layoutAttribute,
                           relatedBy: relation,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: multiplier,
                           constant: layoutAttributes.constant).isActive = true
    }
}
