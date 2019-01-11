//
//  UIView+Constrictor.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

public extension UIView {

    var constrictor: Constrictor {
        return Constrictor(object: self)
    }
}

public extension UILayoutGuide {

    var constrictor: Constrictor {
        return Constrictor(object: self)
    }
}
