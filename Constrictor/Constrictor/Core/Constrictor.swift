//
//  Constrictor.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

public final class Constrictor {
    
    public let constraints = Constraints()
    let object: Anchorable
    
    init(object: Anchorable) {
        self.object = object
    }
    
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
}
