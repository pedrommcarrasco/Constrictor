//
//  NSLayoutConstraint+Set.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - Set
extension NSLayoutConstraint {

    func set(constant: CGFloat, priority: LayoutPriority, state: LayoutState) {
        self.constant = constant
        self.priority = priority.nativeValue()
        self.isActive = state.nativeValue()
    }
}
