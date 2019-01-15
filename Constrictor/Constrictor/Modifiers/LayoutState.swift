//
//  LayoutState.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 15/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Foundation

// MARK: - LayoutState
public enum LayoutState {
    case active
    case inactive
}

// MARK: - Conversion
extension LayoutState {

    func nativeValue() -> Bool {
        switch self {
        case .active: return true
        case .inactive: return false
        }
    }
}
