//
//  Constrictor+Update.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 14/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - Update
extension Constrictor {

    // NARK: Typealias
    public typealias ConstraintCompletion = (NSLayoutConstraint?) -> Void
    public typealias ConstraintsCompletion = ([NSLayoutConstraint]) -> Void

    // MARK: Soft Finder
    @discardableResult
    public func update(_ anchor: Anchor, _ completion: ConstraintsCompletion) -> Self {
        completion(anchor.constraints(for: constraints))

        return self
    }

    @discardableResult
    public func updateFirst(_ anchor: Anchor, _ completion: ConstraintCompletion) -> Self {
        completion(anchor.constraints(for: constraints).first)

        return self
    }

    // MARK: Deep Finder
    @discardableResult
    public func update<T: Anchorable & Equatable>(_ anchorA: Anchor,
                                                  as relation: LayoutRelation? = nil,
                                                  to item: T,
                                                  _ anchorB: Anchor? = nil,
                                                  with constant: CGFloat? = nil,
                                                  prioritizeAs priority: LayoutPriority? = nil,
                                                  state: LayoutState? = nil,
                                                  _ completion: ConstraintCompletion) -> Self {

        let constraints = anchorA.constraints(for: self.constraints)
        let constraint = constraints.contraint(as: relation,
                                               to: item,
                                               anchorB,
                                               with: constant,
                                               prioritizeAs: priority,
                                               state: state)
        completion(constraint)

        return self
    }

    @discardableResult
    public func update<T: Anchorable & Equatable>(_ anchorA: AnchorDimension,
                                                  as relation: LayoutRelation? = nil,
                                                  to item: T?,
                                                  _ anchorB: AnchorDimension? = nil,
                                                  with constant: CGFloat? = nil,
                                                  multiplyBy multiplier: CGFloat? = nil,
                                                  prioritizeAs priority: LayoutPriority? = nil,
                                                  state: LayoutState? = nil,
                                                  _ completion: ConstraintCompletion) -> Self {

        let constraints = anchorA.constraints(for: self.constraints)
        let constraint = constraints.contraint(as: relation,
                                               to: item,
                                               anchorB,
                                               with: constant,
                                               multiplyBy: multiplier,
                                               prioritizeAs: priority,
                                               state: state)
        completion(constraint)

        return self
    }
}
