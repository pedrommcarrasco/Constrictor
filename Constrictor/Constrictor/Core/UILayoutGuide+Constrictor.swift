//
//  UILayoutGuide+Constrictor.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - Constrictor
public extension UILayoutGuide {

    // MARK: Associated Key
    private struct AssociatedKey {
        static var constrictor: UInt8 = 0
    }

    // MARK: Lazy Property
    var constrictor: Constrictor {
        if let constrictor = objc_getAssociatedObject(self, &AssociatedKey.constrictor) as? Constrictor {
            return constrictor
        } else {
            let constrictor = Constrictor(object: self)
            objc_setAssociatedObject(self, &AssociatedKey.constrictor, constrictor, .OBJC_ASSOCIATION_RETAIN)
            return constrictor
        }
    }
}
