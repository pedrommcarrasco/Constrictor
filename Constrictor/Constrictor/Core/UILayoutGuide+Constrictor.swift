//
//  UILayoutGuide+Constrictor.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//

import UIKit

public extension UILayoutGuide {
    
    private struct AssociatedKey {
        static var constrictor: UInt8 = 0
    }
    
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
