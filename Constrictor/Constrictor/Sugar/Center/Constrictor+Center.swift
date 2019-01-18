//
//  Constrictor+Center.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - Center
extension Constrictor {

    @discardableResult
    public func center(as relation:  LayoutRelation = .equal,
                       in item: Anchorable,
                       with constant: CenterConstant,
                       prioritizeAs priority: LayoutPriority = .required,
                       is state: LayoutState = .enabled) -> Self {

        centerX(as: relation, to: item, .centerX, with: constant.centerX,
                prioritizeAs: priority, is: state)
        centerY(as: relation, to: item, .centerY, with: constant.centerY,
                prioritizeAs: priority, is: state)

        return self
    }

    @discardableResult
    public func center(as relation:  LayoutRelation = .equal,
                       in item: Anchorable,
                       with constant: CGFloat = 0,
                       prioritizeAs priority: LayoutPriority = .required,
                       is state: LayoutState = .enabled) -> Self {

        centerX(as: relation, to: item, .centerX, with: constant,
                prioritizeAs: priority, is: state)
        centerY(as: relation, to: item, .centerY, with: constant,
                prioritizeAs: priority, is: state)

        return self
    }
}
