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
                        _ attribute: AnchorYAxis = .centerY,
                        with constant: CGFloat = 0,
                        prioritizeAs priority: UILayoutPriority = .required,
                        isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        let constraint = ConstrictorAssembler.constrict(anchorA: object.centerYAnchor,
                                                        anchorB: attribute.anchor(for: item),
                                                        relation: relation,
                                                        constant: constant,
                                                        priority: priority,
                                                        isActive: isActive)
        constraints.centerY.append(constraint)
        
        return self
    }
    
    @discardableResult
    public func top(as relation: NSLayoutConstraint.Relation = .equal,
                    to item: Anchorable,
                    _ attribute: AnchorYAxis = .top,
                    with constant: CGFloat = 0,
                    prioritizeAs priority: UILayoutPriority = .required,
                    isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        let constraint = ConstrictorAssembler.constrict(anchorA: object.topAnchor,
                                                        anchorB: attribute.anchor(for: item),
                                                        relation: relation,
                                                        constant: constant,
                                                        priority: priority,
                                                        isActive: isActive)
        constraints.top.append(constraint)
        
        return self
    }
    
    @discardableResult
    public func bottom(as relation: NSLayoutConstraint.Relation = .equal,
                       to item: Anchorable,
                       _ attribute: AnchorYAxis = .bottom,
                       with constant: CGFloat = 0,
                       prioritizeAs priority: UILayoutPriority = .required,
                       isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        let constraint = ConstrictorAssembler.constrict(anchorA: object.bottomAnchor,
                                                        anchorB: attribute.anchor(for: item),
                                                        relation: relation,
                                                        constant: constant,
                                                        priority: priority,
                                                        isActive: isActive)
        constraints.bottom.append(constraint)
        
        return self
    }
    
    // MARK: XAxis
    @discardableResult
    public func centerX(as relation: NSLayoutConstraint.Relation = .equal,
                        to item: Anchorable,
                        _ attribute: AnchorXAxis = .centerX,
                        with constant: CGFloat = 0,
                        prioritizeAs priority: UILayoutPriority = .required,
                        isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        let constraint = ConstrictorAssembler.constrict(anchorA: object.centerXAnchor,
                                                        anchorB: attribute.anchor(for: item),
                                                        relation: relation,
                                                        constant: constant,
                                                        priority: priority,
                                                        isActive: isActive)
        constraints.centerX.append(constraint)
        
        return self
    }
    
    @discardableResult
    public func leading(as relation: NSLayoutConstraint.Relation = .equal,
                        to item: Anchorable,
                        _ attribute: AnchorXAxis = .leading,
                        with constant: CGFloat = 0,
                        prioritizeAs priority: UILayoutPriority = .required,
                        isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        let constraint = ConstrictorAssembler.constrict(anchorA: object.leadingAnchor,
                                                        anchorB: attribute.anchor(for: item),
                                                        relation: relation,
                                                        constant: constant,
                                                        priority: priority,
                                                        isActive: isActive)
        constraints.leading.append(constraint)
        
        return self
    }
    
    @discardableResult
    public func trailing(as relation: NSLayoutConstraint.Relation = .equal,
                         to item: Anchorable,
                         _ attribute: AnchorXAxis = .trailing,
                         with constant: CGFloat = 0,
                         prioritizeAs priority: UILayoutPriority = .required,
                         isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        let constraint = ConstrictorAssembler.constrict(anchorA: object.trailingAnchor,
                                                        anchorB: attribute.anchor(for: item),
                                                        relation: relation,
                                                        constant: constant,
                                                        priority: priority,
                                                        isActive: isActive)
        constraints.trailing.append(constraint)
        
        return self
    }
    
    @discardableResult
    public func right(as relation: NSLayoutConstraint.Relation = .equal,
                      to item: Anchorable,
                      _ attribute: AnchorXAxis = .right,
                      with constant: CGFloat = 0,
                      prioritizeAs priority: UILayoutPriority = .required,
                      isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        let constraint = ConstrictorAssembler.constrict(anchorA: object.rightAnchor,
                                                        anchorB: attribute.anchor(for: item),
                                                        relation: relation,
                                                        constant: constant,
                                                        priority: priority,
                                                        isActive: isActive)
        constraints.right.append(constraint)
        
        return self
    }
    
    @discardableResult
    public func left(as relation: NSLayoutConstraint.Relation = .equal,
                     to item: Anchorable,
                     _ attribute: AnchorXAxis = .left,
                     with constant: CGFloat = 0,
                     prioritizeAs priority: UILayoutPriority = .required,
                     isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        let constraint = ConstrictorAssembler.constrict(anchorA: object.leftAnchor,
                                                        anchorB: attribute.anchor(for: item),
                                                        relation: relation,
                                                        constant: constant,
                                                        priority: priority,
                                                        isActive: isActive)
        constraints.left.append(constraint)
        
        return self
    }
    
    // MARK: AnchorDimension
    @discardableResult
    public func width(as relation: NSLayoutConstraint.Relation = .equal,
                      to item: Anchorable,
                      _ attribute: AnchorDimension = .width,
                      with constant: CGFloat = 0,
                      multiplyBy multiplier: CGFloat = 1,
                      prioritizeAs priority: UILayoutPriority = .required,
                      isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        let constraint = ConstrictorAssembler.constrict(anchorA: object.widthAnchor,
                                                        anchorB: attribute.anchor(for: item),
                                                        relation: relation,
                                                        constant: constant,
                                                        multiplier: multiplier,
                                                        priority: priority,
                                                        isActive: isActive)
        constraints.width.append(constraint)
        
        return self
    }
    
    @discardableResult
    public func width(as relation: NSLayoutConstraint.Relation = .equal,
                      to constant: CGFloat,
                      prioritizeAs priority: UILayoutPriority = .required,
                      isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        let constraint = ConstrictorAssembler.constrict(anchor: object.widthAnchor,
                                                        relation: relation,
                                                        constant: constant,
                                                        priority: priority,
                                                        isActive: isActive)
        constraints.width.append(constraint)
        
        return self
    }
    
    @discardableResult
    public func height(as relation: NSLayoutConstraint.Relation = .equal,
                       to item: Anchorable,
                       _ attribute: AnchorDimension = .height,
                       with constant: CGFloat = 0,
                       multiplyBy multiplier: CGFloat = 1,
                       prioritizeAs priority: UILayoutPriority = .required,
                       isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        let constraint = ConstrictorAssembler.constrict(anchorA: object.heightAnchor,
                                                        anchorB: attribute.anchor(for: item),
                                                        relation: relation,
                                                        constant: constant,
                                                        multiplier: multiplier,
                                                        priority: priority,
                                                        isActive: isActive)
        constraints.height.append(constraint)
        
        return self
    }
    
    @discardableResult
    public func height(as relation: NSLayoutConstraint.Relation = .equal,
                       to constant: CGFloat,
                       prioritizeAs priority: UILayoutPriority = .required,
                       isActive: Bool = true) -> Self {
        
        ConstrictorAssembler.configure(object)
        let constraint = ConstrictorAssembler.constrict(anchor: object.heightAnchor,
                                                        relation: relation,
                                                        constant: constant,
                                                        priority: priority,
                                                        isActive: isActive)
        constraints.height.append(constraint)
        
        return self
    }
}
