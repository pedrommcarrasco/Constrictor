//
//  ConstrictorDimension.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

public enum ConstrictorDimension {
    case width
    case height
}

extension ConstrictorDimension {

    func anchor(for anchorable: Anchorable) -> NSLayoutDimension {
        switch self {
        case .width: return anchorable.widthAnchor
        case .height: return anchorable.heightAnchor
        }
    }
}
