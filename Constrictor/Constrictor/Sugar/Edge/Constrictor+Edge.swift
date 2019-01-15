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
    public func edge(as relation:  LayoutRelation = .equal,
                     to item: Anchorable,
                     with constant: CGFloat,
                     prioritizeAs priority: LayoutPriority = .required,
                     is state: LayoutState = .enabled) -> Self {
        
        edge(as: relation, to: item, with: .all(constant), prioritizeAs: priority, is: state)
        
        return self
    }
    
    @discardableResult
    public func edge(as relation:  LayoutRelation = .equal,
                     to item: Anchorable,
                     with constant: EdgeConstant = .zero,
                     prioritizeAs priority: LayoutPriority = .required,
                     is state: LayoutState = .enabled) -> Self {
        
        top(as: relation, to: item, .top, with: constant.top, prioritizeAs: priority, is: state)
        bottom(as: relation, to: item, .bottom, with: constant.bottom, prioritizeAs: priority, is: state)
        leading(as: relation, to: item, .leading, with: constant.leading, prioritizeAs: priority, is: state)
        trailing(as: relation, to: item, .trailing, with: constant.trailing, prioritizeAs: priority, is: state)
        
        return self
    }
    
    @discardableResult
    public func edge(as relation:  LayoutRelation = .equal,
                     to item: Anchorable,
                     _ attributes: EdgeAnchor ...,
                     with constant: CGFloat,
                     prioritizeAs priority: LayoutPriority = .required,
                     is state: LayoutState = .enabled) -> Self {
        
        internalVariadicEdge(as: relation, to: item, attributes, with: .all(constant),
                             prioritizeAs: priority, is: state)
        
        return self
    }
    
    @discardableResult
    public func edge(as relation:  LayoutRelation = .equal,
                     to item: Anchorable,
                     _ attributes: EdgeAnchor ...,
                     with constant: EdgeConstant = .zero,
                     prioritizeAs priority: LayoutPriority = .required,
                     is state: LayoutState = .enabled) -> Self {
        
        internalVariadicEdge(as: relation, to: item, attributes, with: constant,
                             prioritizeAs: priority, is: state)
        
        return self
    }
}

private extension Constrictor {
    
    func internalVariadicEdge(as relation:  LayoutRelation = .equal,
                              to item: Anchorable,
                              _ attributes: [EdgeAnchor],
                              with constant: EdgeConstant = .zero,
                              prioritizeAs priority: LayoutPriority = .required,
                              is state: LayoutState = .enabled) {
        attributes.forEach {
            switch $0 {
            case .top:
                top(as: relation, to: item, .top, with: constant.top,
                    prioritizeAs: priority, is: state)
            case .bottom:
                bottom(as: relation, to: item, .bottom, with: constant.bottom,
                       prioritizeAs: priority, is: state)
            case .leading:
                leading(as: relation, to: item, .leading, with: constant.leading,
                        prioritizeAs: priority, is: state)
            case .trailing:
                trailing(as: relation, to: item, .trailing, with: constant.trailing,
                         prioritizeAs: priority, is: state)
            }
        }
    }
}
