//
//  Anchor.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 12/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

public enum Anchor {
    case top
    case bottom
    case leading
    case trailing
    case right
    case left
    case centerX
    case centerY
    case width
    case height
}

extension Anchor {
    
    func constraints(for constraints: Constraints) -> [NSLayoutConstraint] {
        switch self{
        case .top: return constraints.top
        case .bottom: return constraints.bottom
        case .leading: return constraints.leading
        case .trailing: return constraints.trailing
        case .right: return constraints.right
        case .left: return constraints.left
        case .centerX: return constraints.centerX
        case .centerY: return constraints.centerY
        case .width: return constraints.width
        case .height: return constraints.height
        }
    }
}
