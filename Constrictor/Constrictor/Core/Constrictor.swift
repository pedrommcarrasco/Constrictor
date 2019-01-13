//
//  Constrictor.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - Constrictor
public final class Constrictor {
    
    // MARK: Public Properties
    public let constraints = Constraints()
    
    // MARK: Internal Properties
    let object: Anchorable
    
    // MARK: Init
    init(object: Anchorable) {
        self.object = object
    }
}

// MARK: - Update
extension Constrictor {
    
    // MARK: Soft Finder
    @discardableResult
    public func update(_ anchor: Anchor, _ completion: ([NSLayoutConstraint]) -> Void) -> Self {
        completion(anchor.constraints(for: constraints))
        
        return self
    }
    
    @discardableResult
    public func update(_ anchor: Anchor, _ completion: (NSLayoutConstraint?) -> Void) -> Self {
        completion(anchor.constraints(for: constraints).first)
        
        return self
    }
    
    // MARK: Deep Finder
    @discardableResult
    public func update<T: Anchorable & Equatable>(_ anchorA: Anchor,
                                                  as relation: NSLayoutConstraint.Relation? = nil,
                                                  to item: T,
                                                  _ anchorB: Anchor? = nil,
                                                  with constant: CGFloat? = nil,
                                                  prioritizeAs priority: UILayoutPriority? = nil,
                                                  isActive: Bool? = nil,
                                                  _ completion: (NSLayoutConstraint?) -> Void) -> Self {
        
        let constraints = anchorA.constraints(for: self.constraints)
        let constraint = constraints.contraint(as: relation,
                                               to: item,
                                               anchorB,
                                               with: constant,
                                               prioritizeAs: priority,
                                               isActive: isActive)
        completion(constraint)
        
        return self
    }
    
    @discardableResult
    public func update<T: Anchorable & Equatable>(_ anchorA: AnchorDimension,
                                                  as relation: NSLayoutConstraint.Relation? = nil,
                                                  to item: T?,
                                                  _ anchorB: AnchorDimension? = nil,
                                                  with constant: CGFloat? = nil,
                                                  multiplyBy multiplier: CGFloat? = nil,
                                                  prioritizeAs priority: UILayoutPriority? = nil,
                                                  isActive: Bool? = nil,
                                                  _ completion: (NSLayoutConstraint?) -> Void) -> Self {
        
        let constraints = anchorA.constraints(for: self.constraints)
        let constraint = constraints.contraint(as: relation,
                                               to: item,
                                               anchorB,
                                               with: constant,
                                               multiplyBy: multiplier,
                                               prioritizeAs: priority,
                                               isActive: isActive)
        completion(constraint)
        
        return self
    }
}

extension Constrictor: Equatable {
    
    public static func == (lhs: Constrictor, rhs: Constrictor) -> Bool {
        return lhs.constraints == rhs.constraints
    }
}
