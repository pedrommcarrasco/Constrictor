//
//  NSLayoutConstraintCollection+Finder.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 12/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

extension Collection where Element: NSLayoutConstraint {
    
    func contraint<T: Anchorable & Equatable>(as relation: NSLayoutConstraint.Relation?,
                                              to item: T,
                                              _ anchor: Anchor?,
                                              with constant: CGFloat?,
                                              prioritizeAs priority: UILayoutPriority?,
                                              isActive: Bool?) -> NSLayoutConstraint? {

        return first {
            guard let secondItem = $0.secondItem as? T else { return false }
            
            return secondItem == item
                && anchor == nil ? true : $0.secondAttribute == anchor?.attribute
                && constant == nil ? true : $0.constant == constant
                && priority == nil ? true : $0.priority == priority
                && isActive == nil ? true : $0.isActive == isActive
                && relation == nil ? true : $0.relation == relation
        }
    }
    
    func contraint<T: Anchorable & Equatable>(as relation: NSLayoutConstraint.Relation?,
                                              to item: T?,
                                              _ anchor: AnchorDimension?,
                                              with constant: CGFloat?,
                                              multiplyBy multiplier: CGFloat?,
                                              prioritizeAs priority: UILayoutPriority?,
                                              isActive: Bool?) -> NSLayoutConstraint? {
        
        return first {
            
            return item == nil ? true :  $0.secondItem as? T == item
                && anchor == nil ? true : $0.secondAttribute == anchor?.attribute
                && constant == nil ? true : $0.constant == constant
                && priority == nil ? true : $0.priority == priority
                && multiplier == nil ? true : $0.multiplier == multiplier
                && isActive == nil ? true : $0.isActive == isActive
                && relation == nil ? true : $0.relation == relation
        }
    }
}
