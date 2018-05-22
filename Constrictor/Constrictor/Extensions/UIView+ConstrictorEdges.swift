//
//  UIView+ConstrictorEdges.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 21/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

public extension UIView {

    /**
     Defines the caller's edges as the same as its superview

     - parameters:
        - relation: Establish a relation between both attributes with NSLayoutRelation.
        - constant: CGFloat's value to add to the constraint.
        - multiplier: CGFloat's multiplier based on the values from both selfAttribute and attribute.
        - priority: UILayoutPriority that defines the constraint priority.

     - returns:
     Discardable UIView to allow function's chaining.
     */
    @discardableResult func constrictEdgesToContainer(relation: NSLayoutRelation = .equal,
                                                      constant: CGFloat = 0.0,
                                                      multiplier: CGFloat = 1.0,
                                                      priority: UILayoutPriority = .required) -> UIView {

        guard let superview = superview else { return self }

        constrictEdges(to: superview,
                       relation: relation,
                       constant: constant,
                       multiplier: multiplier,
                       priority: priority)

        return self
    }

    /**
     Defines the caller's edges as the same as the UIView sent by parameter.

     - parameters:
        - view: UIView to match with the caller's .top, .bottom, .leading and .trailing.
        - relation: Establish a relation between both attributes with NSLayoutRelation.
        - constant: CGFloat's value to add to the constraint.
        - multiplier: CGFloat's multiplier based on the values from both selfAttribute and attribute.
        - priority: UILayoutPriority that defines the constraint priority.

     - returns:
     Discardable UIView to allow function's chaining.
     */
    @discardableResult func constrictEdges(to view: UIView,
                                           relation: NSLayoutRelation = .equal,
                                           constant: CGFloat = 0.0,
                                           multiplier: CGFloat = 1.0,
                                           priority: UILayoutPriority = .required) -> UIView {

        constrict(attributes: .top, .bottom, .leading, .trailing,
                  relation: relation,
                  to: view,
                  constant: constant,
                  multiplier: multiplier,
                  priority: priority)
        
        return self
    }
}
