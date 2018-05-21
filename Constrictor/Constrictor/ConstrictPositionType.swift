//
//  ConstrictPositionType.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 21/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

public enum ConstrictorPosition {
    case top
    case bottom
    case leading
    case trailing
    case centerX
    case centerY

    func constrict(viewA: UIView, to viewB: UIView, spacing: CGFloat) {
        switch self {
        case .top:
            viewA.topAnchor(to: viewB.topAnchor, spacing: spacing)
        case .bottom:
            <#code#>
        case .leading:
            <#code#>
        case .trailing:
            <#code#>
        case .centerX:
            <#code#>
        case .centerY:
            <#code#>
        }
    }
}
