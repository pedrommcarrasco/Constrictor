//
//  YAxis.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

public enum YAxis {
    case centerY
    case top
    case bottom
}

extension YAxis {

    func anchor(for anchorable: Anchorable) -> NSLayoutYAxisAnchor {
        switch self {
        case .centerY: return anchorable.centerYAnchor
        case .top: return anchorable.topAnchor
        case .bottom: return anchorable.bottomAnchor
        }
    }
}
