//
//  Constrictor+Size.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

extension Constrictor {
    
    @discardableResult
    public func size(as relation: NSLayoutConstraint.Relation = .equal,
                     to item: Anchorable,
                     with constant: SizeConstant,
                     multiplyBy multiplier: CGFloat = 1,
                     prioritizeAs priority: UILayoutPriority = .required,
                     isActive: Bool = true ) -> Self {
        
        width(as: relation, to: item, .width, with: constant.width,
              multiplyBy: multiplier, prioritizeAs: priority, isActive: isActive)
        height(as: relation, to: item, .height, with: constant.height,
               multiplyBy: multiplier, prioritizeAs: priority, isActive: isActive)
        
        return self
    }
    
    @discardableResult
    public func size(as relation: NSLayoutConstraint.Relation = .equal,
                     to item: Anchorable,
                     with constant: CGFloat = 0,
                     multiplyBy multiplier: CGFloat = 1,
                     prioritizeAs priority: UILayoutPriority = .required,
                     isActive: Bool = true ) -> Self {
        
        width(as: relation, to: item, .width, with: constant,
              multiplyBy: multiplier, prioritizeAs: priority, isActive: isActive)
        height(as: relation, to: item, .height, with: constant,
               multiplyBy: multiplier, prioritizeAs: priority, isActive: isActive)
        
        return self
    }
    
    @discardableResult
    public func size(as relation: NSLayoutConstraint.Relation = .equal,
                     to constant: CGFloat,
                     prioritizeAs priority: UILayoutPriority = .required,
                     isActive: Bool = true ) -> Self {
        
        width(as: relation, to: constant, prioritizeAs: priority, isActive: isActive)
        height(as: relation, to: constant, prioritizeAs: priority, isActive: isActive)
        
        return self
    }
    
    @discardableResult
    public func size(as relation: NSLayoutConstraint.Relation = .equal,
                     to constant: SizeConstant,
                     prioritizeAs priority: UILayoutPriority = .required,
                     isActive: Bool = true ) -> Self {
        
        width(as: relation, to: constant.width, prioritizeAs: priority, isActive: isActive)
        height(as: relation, to: constant.height, prioritizeAs: priority, isActive: isActive)
        
        return self
    }
}
