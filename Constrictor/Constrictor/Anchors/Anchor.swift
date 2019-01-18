//
//  Anchor.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 12/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - Anchor
public enum Anchor: CaseIterable {
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

// MARK: - Properties
extension Anchor {
    
    var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .top: return .top
        case .bottom: return .bottom
        case .leading: return .leading
        case .trailing: return .trailing
        case .right: return .right
        case .left: return .left
        case .centerX: return .centerX
        case .centerY: return .centerY
        case .width: return .width
        case .height: return .height
        }
    }
}

// MARK: - Functions
extension Anchor {
    
    func constraints(for constraints: Constraints) -> [NSLayoutConstraint] {
        switch self {
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
