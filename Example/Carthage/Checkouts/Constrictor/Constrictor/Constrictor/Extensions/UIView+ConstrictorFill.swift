//
//  UIView+ConstrictorFill.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 21/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

public extension UIView {
    
    @discardableResult func constrictFillContainer(relation: NSLayoutRelation = .equal,
                                                   constant: CGFloat = 0.0,
                                                   multipler: CGFloat = 1.0,
                                                   priority: UILayoutPriority = .required) -> UIView {
        
        constrictFill(view: superview,
                      relation: relation,
                      constant: constant,
                      multipler: multipler,
                      priority: priority)
        
        return self
    }
    
    @discardableResult func constrictFill(view: UIView?,
                                          relation: NSLayoutRelation = .equal,
                                          constant: CGFloat = 0.0,
                                          multipler: CGFloat = 1.0,
                                          priority: UILayoutPriority = .required) -> UIView {
        
        constrict(attributes: .top, .bottom, .leading, .trailing,
                  relation: relation,
                  to: view,
                  constant: constant,
                  multipler: multipler,
                  priority: priority)
        
        return self
    }
}
