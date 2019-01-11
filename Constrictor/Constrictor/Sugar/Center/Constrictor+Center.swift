//
//  Constrictor+Center.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

extension Constrictor {

    @discardableResult
    public func center(as relation:  NSLayoutConstraint.Relation = .equal,
                       in item: Anchorable,
                       with constant: ConstrictorCenterConstant,
                       prioritizeAs priority: UILayoutPriority = .required,
                       isActive: Bool = true) -> Self {

        centerX(as: relation, to: item, .centerX, with: constant.x,
                prioritizeAs: priority, isActive: isActive)
        centerY(as: relation, to: item, .centerY, with: constant.y,
                prioritizeAs: priority, isActive: isActive)

        return self
    }

    @discardableResult
    public func center(as relation:  NSLayoutConstraint.Relation = .equal,
                       in item: Anchorable,
                       with constant: CGFloat = 0,
                       prioritizeAs priority: UILayoutPriority = .required,
                       isActive: Bool = true) -> Self {

        centerX(as: relation, to: item, .centerX, with: constant,
                prioritizeAs: priority, isActive: isActive)
        centerY(as: relation, to: item, .centerY, with: constant,
                prioritizeAs: priority, isActive: isActive)

        return self
    }
}
