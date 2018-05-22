//
//  UIView+Constrictor.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 21/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

public extension UIView {

    @discardableResult func constrictToContainer(attributes: NSLayoutAttribute ...,
                                                 relation: NSLayoutRelation = .equal,
                                                 constant: CGFloat = 0.0,
                                                 multipler: CGFloat = 1.0,
                                                 priority: UILayoutPriority = .required) -> UIView {

        attributes.forEach {
            self.constrict($0,
                           relation: relation,
                           to: superview,
                           attribute: $0,
                           constant: constant,
                           multipler: multipler,
                           priority: priority)
        }

        return self
    }

    @discardableResult func constrict(attributes: NSLayoutAttribute ...,
                                      relation: NSLayoutRelation = .equal,
                                      to view: UIView? = nil,
                                      constant: CGFloat = 0.0,
                                      multipler: CGFloat = 1.0,
                                      priority: UILayoutPriority = .required) -> UIView {
        
        attributes.forEach {
            self.constrict($0,
                           relation: relation,
                           to: view,
                           attribute: $0,
                           constant: constant,
                           multipler: multipler,
                           priority: priority)
        }
        
        return self
    }

    @discardableResult func constrict(_ selfAttribute: NSLayoutAttribute,
                                      relation: NSLayoutRelation = .equal,
                                      to view: UIView? = nil,
                                      attribute: NSLayoutAttribute = .notAnAttribute,
                                      constant: CGFloat = 0.0,
                                      multipler: CGFloat = 1.0,
                                      priority: UILayoutPriority = .required) -> UIView {

        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint(item: self,
                           attribute: selfAttribute,
                           relatedBy: relation,
                           toItem: view,
                           attribute: attribute,
                           multiplier: multipler,
                           constant: constant).isActive = true

        return self
    }
}
