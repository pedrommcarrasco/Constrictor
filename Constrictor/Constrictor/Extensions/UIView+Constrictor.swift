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
     Defines one or more constraints together with the view's superview based on the attributes
     sent where every constraint will be defined in the same way.
     
     - returns:
     Discardable UIView to allow function's chaining.

     - parameters:
     - attributes: caller's NSLayoutAttribute to apply constraints.
     - relation: Estabilish a relation between an attribute and another with NSLayoutRelation.
     - attribute: NSLayoutAttribute's of the UIView to apply a constraint with.
     - constant: CGFloat's value to add to the constraint.
     - multiplier: CGFloat's multiplier based on the values from both selfAttribute and attribute.
     - priority: UILayoutPriority that defines the constraint priority.
     */
    @discardableResult func constrictToContainer(attributes: NSLayoutAttribute ...,
        relation: NSLayoutRelation = .equal,
        constant: CGFloat = 0.0,
        multiplier: CGFloat = 1.0,
        priority: UILayoutPriority = .required) -> UIView {

        attributes.forEach {
            self.constrict($0,
                           relation: relation,
                           to: superview,
                           attribute: $0,
                           constant: constant,
                           multiplier: multiplier,
                           priority: priority)
        }

        return self
    }

    /**
     Defines one or more constraints based on the attributes sent where every constraint will be defined in the same way.

     - returns:
     Discardable UIView to allow function's chaining.

     - parameters:
     - attributes: caller's NSLayoutAttribute to apply constraints.
     - relation: Estabilish a relation between an attribute and another with NSLayoutRelation.
     - view: Optional UIView to apply a constraint with.
     - attribute: NSLayoutAttribute's of the UIView to apply a constraint with.
     - constant: CGFloat's value to add to the constraint.
     - multiplier: CGFloat's multiplier based on the values from both selfAttribute and attribute.
     - priority: UILayoutPriority that defines the constraint priority.
     */
    @discardableResult func constrict(attributes: NSLayoutAttribute ...,
        relation: NSLayoutRelation = .equal,
        to view: UIView? = nil,
        constant: CGFloat = 0.0,
        multiplier: CGFloat = 1.0,
        priority: UILayoutPriority = .required) -> UIView {
        
        attributes.forEach {
            self.constrict($0,
                           relation: relation,
                           to: view,
                           attribute: $0,
                           constant: constant,
                           multiplier: multiplier,
                           priority: priority)
        }
        
        return self
    }

    /**
     Core method of the Constrictor's framework. Most flexible function that's able to apply any constraint.

     - returns:
     Discardable UIView to allow function's chaining.

     - parameters:
        - selfAttribute: caller's NSLayoutAttribute to apply a constraint.
        - relation: Estabilish a relation between an attribute and another with NSLayoutRelation.
        - view: Optional UIView to apply a constraint with.
        - attribute: NSLayoutAttribute's of the UIView to apply a constraint with.
        - constant: CGFloat's value to add to the constraint.
        - multiplier: CGFloat's multiplier based on the values from both selfAttribute and attribute.
        - priority: UILayoutPriority that defines the constraint priority.
     */
    @discardableResult func constrict(_ selfAttribute: NSLayoutAttribute,
                                      relation: NSLayoutRelation = .equal,
                                      to view: UIView? = nil,
                                      attribute: NSLayoutAttribute = .notAnAttribute,
                                      constant: CGFloat = 0.0,
                                      multiplier: CGFloat = 1.0,
                                      priority: UILayoutPriority = .required) -> UIView {


        translatesAutoresizingMaskIntoConstraints = false

        let constant = Constant.normalizeConstant(for: selfAttribute, value: constant)

        NSLayoutConstraint(item: self,
                           attribute: selfAttribute,
                           relatedBy: relation,
                           toItem: view,
                           attribute: attribute,
                           multiplier: multiplier,
                           constant: constant).isActive = true

        return self
    }
}
