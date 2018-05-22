//
//  UIView+ConstrictorEdges.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 21/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

public extension UIView {

    @discardableResult func constrictEdgesToContainer(relation: NSLayoutRelation = .equal,
                                                      constant: CGFloat = 0.0,
                                                      multiplier: CGFloat = 1.0,
                                                      priority: UILayoutPriority = .required) -> UIView {

        constrictEdges(to: superview,
                       relation: relation,
                       constant: constant,
                       multiplier: multiplier,
                       priority: priority)

        return self
    }
    
    @discardableResult func constrictEdges(to view: UIView?,
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
