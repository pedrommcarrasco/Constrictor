//
//  UIView+Constrictor.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 21/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

public extension UIView {

    @discardableResult func constrict(_ type: ConstrictorPosition,
                                      to view: UIView? = nil,
                                      spacing: CGFloat) -> UIView {

        switch type {
        case .top:
            topAnchor(to: view, spacing: spacing)
        case .bottom:
            bottomAnchor(to: view, spacing: spacing)
        case .leading:
            leadingAnchor(to: view, spacing: spacing)
        case .trailing:
            trailingAnchorAnchor(to: view, spacing: spacing)
        case .centerX:
            centerXAnchor(to: view, spacing: spacing)
        case .centerY:
            centerYAnchor(to: view, spacing: spacing)
        }

        return self
    }

    @discardableResult func constrict(_ type: ConstrictSize,
                                      to view: UIView? = nil,
                                      size: CGFloat? = nil) -> UIView {

        switch type {
        case .width:
            break
        case .height:
            break
        }

        return self
    }
}

// MARK: - Internal
extension UIView {

    // MARK: Constrain Anchors
    func topAnchor(to view: UIView, spacing: CGFloat) {
        topAnchor.constraint(equalTo: view?.topAnchor ?? superview.topAnchor,
                             constant: spacing).isActive = true
    }

    func bottomAnchor(to view: UIView, spacing: CGFloat) {
        bottomAnchor.constraint(equalTo: view?.bottomAnchor ?? superview.bottomAnchor,
                                constant: spacing).isActive = true
    }

    func trailingAnchorAnchor(to view: UIView, spacing: CGFloat) {
        trailingAnchor.constraint(equalTo: view?.trailingAnchor ?? superview.trailingAnchor,
                                  constant: spacing).isActive = true
    }

    func leadingAnchor(to view: UIView, spacing: CGFloat) {
        leadingAnchor.constraint(equalTo: view?.leadingAnchor ?? superview.leadingAnchor,
                                 constant: spacing).isActive = true
    }

    func centerXAnchor(to view: UIView, spacing: CGFloat) {
        centerXAnchor.constraint(equalTo: view?.centerXAnchor ?? superview.centerXAnchor,
                                 constant: spacing).isActive = true
    }

    func centerYAnchor(to view: UIView, spacing: CGFloat) {
        centerYAnchor.constraint(equalTo: view?.centerYAnchor ?? superview.centerYAnchor,
                                 constant: spacing).isActive = true
    }
}
