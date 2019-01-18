//
//  Constrictor+Size.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - Size
extension Constrictor {
    
    @discardableResult
    public func size(as relation: LayoutRelation = .equal,
                     to item: Anchorable,
                     with constant: SizeConstant,
                     multiplyBy multiplier: CGFloat = 1,
                     prioritizeAs priority: LayoutPriority = .required,
                     is state: LayoutState = .enabled) -> Self {
        
        width(as: relation, to: item, .width, with: constant.width,
              multiplyBy: multiplier, prioritizeAs: priority, is: state)
        height(as: relation, to: item, .height, with: constant.height,
               multiplyBy: multiplier, prioritizeAs: priority, is: state)
        
        return self
    }
    
    @discardableResult
    public func size(as relation: LayoutRelation = .equal,
                     to item: Anchorable,
                     with constant: CGFloat = 0,
                     multiplyBy multiplier: CGFloat = 1,
                     prioritizeAs priority: LayoutPriority = .required,
                     is state: LayoutState = .enabled) -> Self {
        
        width(as: relation, to: item, .width, with: constant,
              multiplyBy: multiplier, prioritizeAs: priority, is: state)
        height(as: relation, to: item, .height, with: constant,
               multiplyBy: multiplier, prioritizeAs: priority, is: state)
        
        return self
    }
    
    @discardableResult
    public func size(as relation: LayoutRelation = .equal,
                     to constant: CGFloat,
                     prioritizeAs priority: LayoutPriority = .required,
                     is state: LayoutState = .enabled) -> Self {
        
        width(as: relation, to: constant, prioritizeAs: priority, is: state)
        height(as: relation, to: constant, prioritizeAs: priority, is: state)
        
        return self
    }
    
    @discardableResult
    public func size(as relation: LayoutRelation = .equal,
                     to constant: SizeConstant,
                     prioritizeAs priority: LayoutPriority = .required,
                     is state: LayoutState = .enabled) -> Self {
        
        width(as: relation, to: constant.width, prioritizeAs: priority, is: state)
        height(as: relation, to: constant.height, prioritizeAs: priority, is: state)
        
        return self
    }
}
