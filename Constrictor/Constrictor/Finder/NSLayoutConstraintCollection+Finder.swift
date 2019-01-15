//
//  NSLayoutConstraintCollection+Finder.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 12/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - Finder
extension Collection where Element: NSLayoutConstraint {
    
    func contraint<T: Anchorable & Equatable>(as relation: LayoutRelation?,
                                              to item: T,
                                              _ anchor: Anchor?,
                                              with constant: CGFloat?,
                                              prioritizeAs priority: LayoutPriority?,
                                              state: LayoutState?) -> NSLayoutConstraint? {

        return first {
            guard let secondItem = $0.secondItem as? T else { return false }
            
            return secondItem == item
                && anchor == nil ? true : $0.secondAttribute == anchor?.attribute
                && constant == nil ? true : $0.constant == constant
                && priority == nil ? true : $0.priority == priority?.nativeValue()
                && state == nil ? true : $0.isActive == state?.nativeValue()
                && relation == nil ? true : $0.relation == relation?.nativeValue()
        }
    }
    
    func contraint<T: Anchorable & Equatable>(as relation: LayoutRelation?,
                                              to item: T?,
                                              _ anchor: AnchorDimension?,
                                              with constant: CGFloat?,
                                              multiplyBy multiplier: CGFloat?,
                                              prioritizeAs priority: LayoutPriority?,
                                              state: LayoutState?) -> NSLayoutConstraint? {
        
        return first {
            
            return item == nil ? true :  $0.secondItem as? T == item
                && anchor == nil ? true : $0.secondAttribute == anchor?.attribute
                && constant == nil ? true : $0.constant == constant
                && priority == nil ? true : $0.priority == priority?.nativeValue()
                && multiplier == nil ? true : $0.multiplier == multiplier
                && state == nil ? true : $0.isActive == state?.nativeValue()
                && relation == nil ? true : $0.relation == relation?.nativeValue()
        }
    }
}
