//
//  AnchorXAxis.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - AnchorXAxis
public enum AnchorXAxis: CaseIterable {
    case centerX
    case left
    case leading
    case right
    case trailing
}

// MARK: - Functions
extension AnchorXAxis {

    func anchor(for anchorable: Anchorable) -> NSLayoutXAxisAnchor {
        switch self {
        case .centerX: return anchorable.centerXAnchor
        case .left: return anchorable.leftAnchor
        case .leading: return anchorable.leadingAnchor
        case .right: return anchorable.rightAnchor
        case .trailing: return anchorable.trailingAnchor
        }
    }
}
