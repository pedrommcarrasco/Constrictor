//
//  Constrictor+Edges.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - Edge
extension Constrictor {
    
    @discardableResult
    public func edge(as relation:  NSLayoutConstraint.Relation = .equal,
                     to item: Anchorable,
                     with constant: CGFloat,
                     prioritizeAs priority: UILayoutPriority = .required,
                     isActive: Bool = true) -> Self {
        
        edge(as: relation, to: item, with: .all(constant), prioritizeAs: priority, isActive: isActive)
        
        return self
    }
    
    @discardableResult
    public func edge(as relation:  NSLayoutConstraint.Relation = .equal,
                     to item: Anchorable,
                     with constant: EdgeConstant = .zero,
                     prioritizeAs priority: UILayoutPriority = .required,
                     isActive: Bool = true) -> Self {
        
        top(as: relation, to: item, .top, with: constant.top, prioritizeAs: priority, isActive: isActive)
        bottom(as: relation, to: item, .bottom, with: constant.bottom, prioritizeAs: priority, isActive: isActive)
        leading(as: relation, to: item, .leading, with: constant.leading, prioritizeAs: priority, isActive: isActive)
        trailing(as: relation, to: item, .trailing, with: constant.trailing, prioritizeAs: priority, isActive: isActive)
        
        return self
    }
    
    @discardableResult
    public func edge(as relation:  NSLayoutConstraint.Relation = .equal,
                     to item: Anchorable,
                     _ attributes: EdgeAnchor ...,
                     with constant: CGFloat,
                     prioritizeAs priority: UILayoutPriority = .required,
                     isActive: Bool = true) -> Self {
        
        internalVariadicEdge(as: relation, to: item, attributes, with: .all(constant),
                             prioritizeAs: priority, isActive: isActive)
        
        return self
    }
    
    @discardableResult
    public func edge(as relation:  NSLayoutConstraint.Relation = .equal,
                     to item: Anchorable,
                     _ attributes: EdgeAnchor ...,
                     with constant: EdgeConstant = .zero,
                     prioritizeAs priority: UILayoutPriority = .required,
                     isActive: Bool = true) -> Self {
        
        internalVariadicEdge(as: relation, to: item, attributes, with: constant,
                             prioritizeAs: priority, isActive: isActive)
        
        return self
    }
}

private extension Constrictor {
    
    func internalVariadicEdge(as relation:  NSLayoutConstraint.Relation = .equal,
                              to item: Anchorable,
                              _ attributes: [EdgeAnchor],
                              with constant: EdgeConstant = .zero,
                              prioritizeAs priority: UILayoutPriority = .required,
                              isActive: Bool = true) {
        attributes.forEach {
            switch $0 {
            case .top:
                top(as: relation, to: item, .top, with: constant.top,
                    prioritizeAs: priority, isActive: isActive)
            case .bottom:
                bottom(as: relation, to: item, .bottom, with: constant.bottom,
                       prioritizeAs: priority, isActive: isActive)
            case .leading:
                leading(as: relation, to: item, .leading, with: constant.leading,
                        prioritizeAs: priority, isActive: isActive)
            case .trailing:
                trailing(as: relation, to: item, .trailing, with: constant.trailing,
                         prioritizeAs: priority, isActive: isActive)
            }
        }
    }
}
