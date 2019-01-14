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
    weak var object: Anchorable?
    
    // MARK: Init
    init(object: Anchorable) {
        self.object = object
    }
}

extension Constrictor: Equatable {
    
    public static func == (lhs: Constrictor, rhs: Constrictor) -> Bool {
        return lhs.constraints == rhs.constraints
    }
}
