//
//  NSLayoutConstraint+Set.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {

    func set(constant: CGFloat, priority: UILayoutPriority, isActive: Bool) {
        self.constant = constant
        self.priority = priority
        self.isActive = isActive
    }
}
