//
//  UIView+ConstrictorCenter.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 21/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

public extension UIView {


    @discardableResult func constrictCenterInContainer(relation: NSLayoutRelation = .equal,
                                                       constant: CGFloat = 0.0,
                                                       multipler: CGFloat = 1.0,
                                                       priority: UILayoutPriority = .required) -> UIView {
        
        constrictCenter(to: superview,
                        relation: relation,
                        constant: constant,
                        multipler: multipler,
                        priority: priority)
        
        return self
    }
    
    @discardableResult func constrictCenter(to view: UIView?,
                                            relation: NSLayoutRelation = .equal,
                                            constant: CGFloat = 0.0,
                                            multipler: CGFloat = 1.0,
                                            priority: UILayoutPriority = .required) -> UIView {

            constrict(.centerX,
                      relation: relation,
                      to: view,
                      attribute: .centerX,
                      constant: constant,
                      multipler: multipler,
                      priority: priority)

            constrict(.centerY,
                      relation: relation,
                      to: view,
                      attribute: .centerY,
                      constant: constant,
                      multipler: multipler,
                      priority: priority)
        
        return self
    }
}
