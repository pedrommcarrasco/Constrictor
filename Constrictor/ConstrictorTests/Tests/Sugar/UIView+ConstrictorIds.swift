//
//  UIView+ConstrictorIds.swift
//  ConstrictorTests
//
//  Created by João Pereira on 31/10/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation
import XCTest
@testable import Constrictor

// MARK: - UIViewConstrictorEdgesTests
class UIViewConstrictorIDTests: XCTestCase, ConstraintTestable {
    
    // MARK: Constants
    private enum Constants {
        static let constant: CGFloat = 50.0
        static let multiplier: CGFloat = 0.5
    }
    
    // MARK: Properties
    private var viewController: UIViewController!
    private var aView: UIView!
    private var bView: UIView!
    
    private let constraintIdentifier = "someIdentifier"
    
    // MARK: Lifecycle
    override func setUp() {
        super.setUp()
        
        aView = UIView()
        bView = UIView()
        
        viewController = UIViewController()
        viewController.loadViewIfNeeded()
        viewController.view.addSubview(aView)
    }
}

// MARK: - Constraints with ID tests
extension UIViewConstrictorIDTests {
        
    func testConstrictSizeToViewController() {
        aView.constrictSize(to: viewController, multiplyBy: Constants.multiplier, using: constraintIdentifier)
        XCTAssertNotNil(viewController.view.findConstraint(withID: constraintIdentifier))
    }
    
    func testConstrictCenter() {
        aView.constrictCenter(in: viewController, using: constraintIdentifier)
        XCTAssertNotNil(viewController.view.findConstraint(withID: constraintIdentifier))
    }
}
