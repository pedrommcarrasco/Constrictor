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
    
    // MARK: Properties
    public let constraints = Constraints()
    weak var object: Anchorable?
    
    // MARK: Init
    init(object: Anchorable) {
        self.object = object
    }
}

// MARK: - Equatable
extension Constrictor: Equatable {
    
    public static func == (lhs: Constrictor, rhs: Constrictor) -> Bool {
        return lhs.constraints == rhs.constraints
    }
}
