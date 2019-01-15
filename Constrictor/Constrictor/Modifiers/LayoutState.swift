//
//  LayoutState.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 15/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - LayoutState
public enum LayoutState {
    case enabled
    case disabled
}

// MARK: - Conversion
extension LayoutState {

    func nativeValue() -> Bool {
        switch self {
        case .enabled: return true
        case .disabled: return false
        }
    }
}

// MARK: - NSLayoutConstraint's Sugar
public extension NSLayoutConstraint {

    public func enable() {
        isActive = true
    }

    public func disable() {
        isActive = false
    }
}
