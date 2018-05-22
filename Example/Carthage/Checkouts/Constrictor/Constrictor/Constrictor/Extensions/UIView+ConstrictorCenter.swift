//
//  UIView+ConstrictorCenter.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 21/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

public extension UIView {

    /**
     Centers the caller in its superview.

     - parameters:
        - relation: Estabilish a relation between an attribute and another with NSLayoutRelation.
        - constant: CGFloat's value to add to the constraint.
        - multiplier: CGFloat's multiplier based on the values from both selfAttribute and attribute.
        - priority: UILayoutPriority that defines the constraint priority.

     - returns:
     Discardable UIView to allow function's chaining.
     */
    @discardableResult func constrictCenterInContainer(relation: NSLayoutRelation = .equal,
                                                       constant: CGFloat = 0.0,
                                                       multiplier: CGFloat = 1.0,
                                                       priority: UILayoutPriority = .required) -> UIView {

        guard let superview = superview else { return self }
        
        constrictCenter(to: superview,
                        relation: relation,
                        constant: constant,
                        multiplier: multiplier,
                        priority: priority)
        
        return self
    }

    /**
     Centers the caller in the view sent by parameter.

     - parameters:
        - view: UIView to center with.
        - relation: Estabilish a relation between an attribute and another with NSLayoutRelation.
        - constant: CGFloat's value to add to the constraint.
        - multiplier: CGFloat's multiplier based on the values from both selfAttribute and attribute.
        - priority: UILayoutPriority that defines the constraint priority.

     - returns:
     Discardable UIView to allow function's chaining.
     */
    @discardableResult func constrictCenter(to view: UIView,
                                            relation: NSLayoutRelation = .equal,
                                            constant: CGFloat = 0.0,
                                            multiplier: CGFloat = 1.0,
                                            priority: UILayoutPriority = .required) -> UIView {

            constrict(.centerX,
                      relation: relation,
                      to: view,
                      attribute: .centerX,
                      constant: constant,
                      multiplier: multiplier,
                      priority: priority)

            constrict(.centerY,
                      relation: relation,
                      to: view,
                      attribute: .centerY,
                      constant: constant,
                      multiplier: multiplier,
                      priority: priority)
        
        return self
    }
}
