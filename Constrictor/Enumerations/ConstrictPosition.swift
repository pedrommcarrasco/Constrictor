//
//  ConstrictPosition.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 21/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

public enum ConstrictPosition {
    case top
    case bottom
    case leading
    case trailing
    case centerX
    case centerY
}

extension ConstrictPosition {
    
    func constrict(viewA: UIView, to viewB: UIView, spacing: CGFloat) {
        switch self {
        case .top:
            viewA.topAnchor(to: viewB, spacing: spacing)
        case .bottom:
            viewA.bottomAnchor(to: viewB, spacing: spacing)
        case .leading:
            viewA.leadingAnchor(to: viewB, spacing: spacing)
        case .trailing:
            viewA.trailingAnchor(to: viewB, spacing: spacing)
        case .centerX:
            viewA.centerXAnchor(to: viewB, spacing: spacing)
        case .centerY:
            viewA.centerYAnchor(to: viewB, spacing: spacing)
        }
    }
}
