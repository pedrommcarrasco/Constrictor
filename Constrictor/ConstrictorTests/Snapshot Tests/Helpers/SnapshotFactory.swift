//
//  SnapshotFactory.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 13/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - SnapshotFactory
struct SnapshotFactory {
    
    static func viewController(with view: UIView) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.addSubview(view)
        viewController.view.backgroundColor = .red
        return viewController
    }
    
    static func view() -> UIView {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }
}
