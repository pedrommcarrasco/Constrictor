//
//  ConstrictorConstraints.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 11/01/2019.
//

import UIKit

// MARK: - Constraints
public final class Constraints {

    // MARK: Properties
    public internal(set) var top = [NSLayoutConstraint]()
    public internal(set) var bottom = [NSLayoutConstraint]()
    public internal(set) var leading = [NSLayoutConstraint]()
    public internal(set) var trailing = [NSLayoutConstraint]()
    public internal(set) var right = [NSLayoutConstraint]()
    public internal(set) var left = [NSLayoutConstraint]()
    public internal(set) var centerX = [NSLayoutConstraint]()
    public internal(set) var centerY = [NSLayoutConstraint]()
    public internal(set) var width = [NSLayoutConstraint]()
    public internal(set) var height = [NSLayoutConstraint]()
}

// MARK: - Equatable
extension Constraints: Equatable {
    
    public static func == (lhs: Constraints, rhs: Constraints) -> Bool {
        return lhs.top == rhs.top
        && lhs.bottom == rhs.bottom
        && lhs.leading == rhs.leading
        && lhs.trailing == rhs.trailing
        && lhs.right == rhs.right
        && lhs.left == rhs.left
        && lhs.centerX == rhs.centerX
        && lhs.centerY == rhs.centerY
        && lhs.width == rhs.width
        && lhs.height == rhs.height
    }
}
