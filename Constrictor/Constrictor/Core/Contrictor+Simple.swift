//
//  Contrictor+Standard.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

extension Constrictor {
    
    // MARK: YAxis
    @discardableResult
    public func centerY(as relation: NSLayoutConstraint.Relation = .equal,
                        to item: Anchorable,
                        _ attribute: YAxis = .centerY,
                        with constant: CGFloat = 0,
                        prioritizeAs priority: UILayoutPriority = .required,
                        isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        ConstrictorAssembler.constrict(anchorA: object.centerYAnchor,
                                       anchorB: attribute.anchor(for: item),
                                       relation: relation,
                                       constant: constant,
                                       priority: priority,
                                       isActive: isActive)
        
        return self
    }
    
    @discardableResult
    public func top(as relation: NSLayoutConstraint.Relation = .equal,
                    to item: Anchorable,
                    _ attribute: YAxis = .top,
                    with constant: CGFloat = 0,
                    prioritizeAs priority: UILayoutPriority = .required,
                    isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        ConstrictorAssembler.constrict(anchorA: object.topAnchor,
                                       anchorB: attribute.anchor(for: item),
                                       relation: relation,
                                       constant: constant,
                                       priority: priority,
                                       isActive: isActive)
        
        return self
    }
    
    @discardableResult
    public func bottom(as relation: NSLayoutConstraint.Relation = .equal,
                       to item: Anchorable,
                       _ attribute: YAxis = .bottom,
                       with constant: CGFloat = 0,
                       prioritizeAs priority: UILayoutPriority = .required,
                       isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        ConstrictorAssembler.constrict(anchorA: object.bottomAnchor,
                                       anchorB: attribute.anchor(for: item),
                                       relation: relation,
                                       constant: constant,
                                       priority: priority,
                                       isActive: isActive)
        
        return self
    }
    
    // MARK: XAxis
    @discardableResult
    public func centerX(as relation: NSLayoutConstraint.Relation = .equal,
                        to item: Anchorable,
                        _ attribute: XAxis = .centerX,
                        with constant: CGFloat = 0,
                        prioritizeAs priority: UILayoutPriority = .required,
                        isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        ConstrictorAssembler.constrict(anchorA: object.centerXAnchor,
                                       anchorB: attribute.anchor(for: item),
                                       relation: relation,
                                       constant: constant,
                                       priority: priority,
                                       isActive: isActive)
        
        return self
    }
    
    @discardableResult
    public func leading(as relation: NSLayoutConstraint.Relation = .equal,
                        to item: Anchorable,
                        _ attribute: XAxis = .leading,
                        with constant: CGFloat = 0,
                        prioritizeAs priority: UILayoutPriority = .required,
                        isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        ConstrictorAssembler.constrict(anchorA: object.leadingAnchor,
                                       anchorB: attribute.anchor(for: item),
                                       relation: relation,
                                       constant: constant,
                                       priority: priority,
                                       isActive: isActive)
        
        return self
    }
    
    @discardableResult
    public func trailing(as relation: NSLayoutConstraint.Relation = .equal,
                         to item: Anchorable,
                         _ attribute: XAxis = .trailing,
                         with constant: CGFloat = 0,
                         prioritizeAs priority: UILayoutPriority = .required,
                         isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        ConstrictorAssembler.constrict(anchorA: object.trailingAnchor,
                                       anchorB: attribute.anchor(for: item),
                                       relation: relation,
                                       constant: constant,
                                       priority: priority,
                                       isActive: isActive)
        
        return self
    }
    
    @discardableResult
    public func right(as relation: NSLayoutConstraint.Relation = .equal,
                      to item: Anchorable,
                      _ attribute: XAxis = .right,
                      with constant: CGFloat = 0,
                      prioritizeAs priority: UILayoutPriority = .required,
                      isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        ConstrictorAssembler.constrict(anchorA: object.rightAnchor,
                                       anchorB: attribute.anchor(for: item),
                                       relation: relation,
                                       constant: constant,
                                       priority: priority,
                                       isActive: isActive)
        
        return self
    }
    
    @discardableResult
    public func left(as relation: NSLayoutConstraint.Relation = .equal,
                     to item: Anchorable,
                     _ attribute: XAxis = .left,
                     with constant: CGFloat = 0,
                     prioritizeAs priority: UILayoutPriority = .required,
                     isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        ConstrictorAssembler.constrict(anchorA: object.leftAnchor,
                                       anchorB: attribute.anchor(for: item),
                                       relation: relation,
                                       constant: constant,
                                       priority: priority,
                                       isActive: isActive)
        
        return self
    }
    
    // MARK: Dimension
    @discardableResult
    public func width(as relation: NSLayoutConstraint.Relation = .equal,
                      to item: Anchorable,
                      _ attribute: Dimension = .width,
                      with constant: CGFloat = 0,
                      multiplyBy multiplier: CGFloat = 1,
                      prioritizeAs priority: UILayoutPriority = .required,
                      isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        ConstrictorAssembler.constrict(anchorA: object.widthAnchor,
                                       anchorB: attribute.anchor(for: item),
                                       relation: relation,
                                       constant: constant,
                                       multiplier: multiplier,
                                       priority: priority,
                                       isActive: isActive)
        
        return self
    }
    
    @discardableResult
    public func width(as relation: NSLayoutConstraint.Relation = .equal,
                      to constant: CGFloat,
                      prioritizeAs priority: UILayoutPriority = .required,
                      isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        ConstrictorAssembler.constrict(anchor: object.widthAnchor,
                                       relation: relation,
                                       constant: constant,
                                       priority: priority,
                                       isActive: isActive)
        
        return self
    }
    
    @discardableResult
    public func height(as relation: NSLayoutConstraint.Relation = .equal,
                       to item: Anchorable,
                       _ attribute: Dimension = .height,
                       with constant: CGFloat = 0,
                       multiplyBy multiplier: CGFloat = 1,
                       prioritizeAs priority: UILayoutPriority = .required,
                       isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        ConstrictorAssembler.constrict(anchorA: object.heightAnchor,
                                       anchorB: attribute.anchor(for: item),
                                       relation: relation,
                                       constant: constant,
                                       multiplier: multiplier,
                                       priority: priority,
                                       isActive: isActive)
        
        return self
    }
    
    @discardableResult
    public func height(as relation: NSLayoutConstraint.Relation = .equal,
                       to constant: CGFloat,
                       prioritizeAs priority: UILayoutPriority = .required,
                       isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        ConstrictorAssembler.constrict(anchor: object.heightAnchor,
                                       relation: relation,
                                       constant: constant,
                                       priority: priority,
                                       isActive: isActive)
        
        return self
    }
}