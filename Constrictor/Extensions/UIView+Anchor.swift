//
//  aa.swift
//  Constrictor
//
//  Created by Pedro Carrasco on 21/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: Constrain Anchors
extension UIView {
    
    func topAnchor(to view: UIView, spacing: CGFloat) {
        topAnchor.constraint(equalTo: view.topAnchor,
                             constant: spacing).isActive = true
    }
    
    func bottomAnchor(to view: UIView, spacing: CGFloat) {
        bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                constant: spacing).isActive = true
    }
    
    func trailingAnchor(to view: UIView, spacing: CGFloat) {
        trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                  constant: spacing).isActive = true
    }
    
    func leadingAnchor(to view: UIView, spacing: CGFloat) {
        leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                 constant: spacing).isActive = true
    }
    
    func centerXAnchor(to view: UIView, spacing: CGFloat) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor,
                                 constant: spacing).isActive = true
    }
    
    func centerYAnchor(to view: UIView, spacing: CGFloat) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor,
                                 constant: spacing).isActive = true
    }
}
