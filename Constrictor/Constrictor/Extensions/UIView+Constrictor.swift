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
     Defines one or more constraints together with the view's superview. It's based on the attributes
     sent where every constraint will be defined in the same way.

     - parameters:
        - withinSafeArea: Boolean indicating if the constraint should be applied to the view's safeArea.
        - attributes: Caller's NSLayoutAttribute where the constraints will be applied.
        - relation: Establish a relation between both attributes with NSLayoutRelation.
        - attribute: NSLayoutAttribute's of the superview to match with the caller's attribute.
        - constant: CGFloat's value to add to the constraint.
        - multiplier: CGFloat's multiplier based on the values from both selfAttribute and attribute.
        - priority: UILayoutPriority that defines the constraint priority.

     - returns:
     Discardable UIView to allow function's chaining.
     */
    @discardableResult func constrictToContainer(withinSafeArea: Bool = true,
                                                 attributes: NSLayoutAttribute ..., relation: NSLayoutRelation = .equal,
                                                 constant: CGFloat = 0.0, multiplier: CGFloat = 1.0,
                                                 priority: UILayoutPriority = .required) -> UIView {

        attributes.forEach {
            self.constrict($0,
                           relation: relation,
                           to: superview,
                           withinSafeArea: withinSafeArea,
                           attribute: $0,
                           constant: constant,
                           multiplier: multiplier,
                           priority: priority)
        }

        return self
    }

    /**
     Defines one or more constraints based on the attributes sent where every constraint will be defined in the same way.

     - parameters:
        - attributes: Caller's NSLayoutAttribute where the constraints will be applied.
        - relation: Establish a relation between both attributes with NSLayoutRelation.
        - view: Optional UIView to match with the caller's NSLayoutAttribute(s).
        - withinSafeArea: Boolean indicating if the constraint should be applied to the view's safeArea.
        - constant: CGFloat's value to add to the constraint.
        - multiplier: CGFloat's multiplier based on the values from both selfAttribute and attribute.
        - priority: UILayoutPriority that defines the constraint priority.

     - returns:
     Discardable UIView to allow function's chaining.
     */
    @discardableResult func constrict(attributes: NSLayoutAttribute ..., relation: NSLayoutRelation = .equal,
                                      to view: UIView? = nil, withinSafeArea: Bool = true, constant: CGFloat = 0.0,
                                      multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) -> UIView {
        
        attributes.forEach {
            self.constrict($0,
                           relation: relation,
                           to: view,
                           withinSafeArea: withinSafeArea,
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
        - relation: Establish a relation between both attributes with NSLayoutRelation.
        - view: Optional UIView to match with the caller's NSLayoutAttribute(s).
        - withinSafeArea: Boolean indicating if the constraint should be applied to the view's safeArea.
        - attribute: NSLayoutAttribute's of the superview to match with the caller's attribute.
        - constant: CGFloat's value to add to the constraint.
        - multiplier: CGFloat's multiplier based on the values from both selfAttribute and attribute.
        - priority: UILayoutPriority that defines the constraint priority.

     - returns:
     Discardable UIView to allow function's chaining.
     */
    @discardableResult func constrict(_ selfAttribute: NSLayoutAttribute, relation: NSLayoutRelation = .equal,
                                      to view: UIView? = nil, withinSafeArea: Bool = true,
                                      attribute: NSLayoutAttribute = .notAnAttribute, constant: CGFloat = 0.0,
                                      multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) -> UIView {


        translatesAutoresizingMaskIntoConstraints = false

        let constant = Constant.normalizeConstant(for: selfAttribute, value: constant)

        NSLayoutConstraint(item: self,
                           attribute: selfAttribute,
                           relatedBy: relation,
                           toItem: Item.object(for: view, withinSafeArea: withinSafeArea),
                           attribute: attribute,
                           multiplier: multiplier,
                           constant: constant).isActive = true

        return self
    }
}
