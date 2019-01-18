//
//  AnchorDimension.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - AnchorDimension
public enum AnchorDimension: CaseIterable {
    case width
    case height
}

// MARK: - Properties
extension AnchorDimension {
    
    var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .width: return .width
        case .height: return .height
        }
    }
}

// MARK: - Functions
extension AnchorDimension {

    func anchor(for anchorable: Anchorable) -> NSLayoutDimension {
        switch self {
        case .width: return anchorable.widthAnchor
        case .height: return anchorable.heightAnchor
        }
    }
    
    func constraints(for constraints: Constraints) -> [NSLayoutConstraint] {
        switch self {
        case .width: return constraints.width
        case .height: return constraints.height
        }
    }
}
