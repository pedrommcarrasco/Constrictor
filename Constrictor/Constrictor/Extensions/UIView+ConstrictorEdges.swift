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
        - withinSafeArea: Boolean indicating if the constraint should be applied to the view's safeArea.
        - relation: Establish a relation between both attributes with NSLayoutRelation.
        - constant: CGFloat's value to add to the constraint.
        - multiplier: CGFloat's multiplier based on the values from both selfAttribute and attribute.
        - priority: UILayoutPriority that defines the constraint priority.

     - returns:
     Discardable UIView to allow function's chaining.
     */
    @discardableResult func constrictEdgesToSuperview(withinSafeArea: Bool = true, relation: NSLayoutRelation = .equal,
                                                      constant: CGFloat = 0.0, multiplier: CGFloat = 1.0,
                                                      priority: UILayoutPriority = .required) -> UIView {

        guard let superview = superview else { return self }

        constrictEdges(to: superview,
                       withinSafeArea: withinSafeArea,
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
        - withinSafeArea: Boolean indicating if the constraint should be applied to the view's safeArea.
        - relation: Establish a relation between both attributes with NSLayoutRelation.
        - constant: CGFloat's value to add to the constraint.
        - multiplier: CGFloat's multiplier based on the values from both selfAttribute and attribute.
        - priority: UILayoutPriority that defines the constraint priority.

     - returns:
     Discardable UIView to allow function's chaining.
     */
    @discardableResult func constrictEdges(_ relation: NSLayoutRelation = .equal, to view: UIView,
                                           withinSafeArea: Bool = true, constant: CGFloat = 0.0,
                                           multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) -> UIView {
        
        if withinSafeArea {
            constrict(relation, to: .v(view, .safe(.top)), .v(view, .safe(.bottom)),
                      .v(view, .safe(.leading)), .v(view, .safe(.trailing)),
                      constant: constant, multiplier: multiplier, priority: priority)
            
        } else {
            constrict(relation, to: .v(view, .attribute(.top)), .v(view, .attribute(.bottom)),
                      .v(view, .attribute(.leading)), .v(view, .attribute(.trailing)),
                      constant: constant, multiplier: multiplier, priority: priority)
        }
        
        return self
    }
}
