//
//  UIView+ConstrictorCenterTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 23/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

class UIViewConstrictorCenterTests: XCTestCase, ConstraintTestable {

    // MARK: Constants
    enum Constants {

        static let constant: CGFloat = 50.0
        static let multiplier: CGFloat = 0.75
    }

    // MARK: Properties
    var viewController: UIViewController!
    var aView: UIView!
    var bView: UIView!

    // MARK: Lifecycle
    override func setUp() {
        super.setUp()

        aView = UIView()
        bView = UIView()

        viewController = UIViewController()
        viewController.loadViewIfNeeded()
    }

    override func tearDown() {

        aView = nil
        bView = nil

        super.tearDown()
    }

    // MARK: Test - constrictCenterInViewController(_ viewController: UIViewController, relation: NSLayoutRelation = .equal, ...
    func testConstrictCenterInViewControllerWithConstantMultiplier() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrictCenterInController(viewController, with: .x(Constants.constant) & .y(Constants.constant), multiplyBy: Constants.multiplier)

        // Tests
        let centerXConstraints = viewController.view.findConstraints(for: .centerX, relatedTo: aView)
        let centerYConstraints = viewController.view.findConstraints(for: .centerY, relatedTo: aView)

        XCTAssertEqual(centerXConstraints.count, 1)
        XCTAssertEqual(centerYConstraints.count, 1)

        guard let centerXConstraint = centerXConstraints.first,
            let centerYConstraint = centerYConstraints.first else { return XCTFail() }

        testConstraint(centerXConstraint, constant: Constants.constant, multiplier: Constants.multiplier)
        testConstraint(centerYConstraint, constant: Constants.constant, multiplier: Constants.multiplier)
    }
    
    func testConstrictCenterInViewControllerWithoutGuides() {
        
        // Setup
        viewController.view.addSubview(aView)
        aView.constrictCenterInController(viewController, withinGuides: false)
        
        // Tests
        let centerXConstraints = viewController.view.findConstraints(for: .centerX, relatedTo: aView)
        let centerYConstraints = viewController.view.findConstraints(for: .centerY, relatedTo: aView)
        
        XCTAssertEqual(centerXConstraints.count, 1)
        XCTAssertEqual(centerYConstraints.count, 1)
        
        guard let centerXConstraint = centerXConstraints.first,
            let centerYConstraint = centerYConstraints.first else { return XCTFail() }
        
        testConstraint(centerXConstraint)
        testConstraint(centerYConstraint)
    }

    // MARK: Test - constrictCenterInSuperview(_ relation: NSLayoutRelation = .equal, constant: CGFloat = 0.0, ...
    func testConstrictCenterInSuperViewWithConstantMultiplier() {

        // Setup
        viewController.view.addSubview(aView)
        aView.addSubview(bView)
        bView.constrictCenterInParent(with: .x(Constants.constant) & .y(Constants.constant), multiplyBy: Constants.multiplier)

        // Tests
        let centerXConstraints = aView.findConstraints(for: .centerX, relatedTo: bView)
        let centerYConstraints = aView.findConstraints(for: .centerY, relatedTo: bView)

        XCTAssertEqual(centerXConstraints.count, 1)
        XCTAssertEqual(centerYConstraints.count, 1)

        guard let centerXConstraint = centerXConstraints.first,
            let centerYConstraint = centerYConstraints.first else { return XCTFail() }

        testConstraint(centerXConstraint, constant: Constants.constant, multiplier: Constants.multiplier)
        testConstraint(centerYConstraint, constant: Constants.constant, multiplier: Constants.multiplier)
    }

    // MARK: Test - constrictCenter(_ relation: NSLayoutRelation = .equal, to item: Constrictable,
    func testConstrictCenter() {

        // Setup
        viewController.view.addSubview(aView)
        viewController.view.addSubview(bView)
        bView.constrictCenter(to: aView)

        // Tests
        let centerXConstraints = viewController.view.findConstraints(for: .centerX, relatedTo: bView)
        let centerYConstraints = viewController.view.findConstraints(for: .centerY, relatedTo: bView)

        XCTAssertEqual(centerXConstraints.count, 1)
        XCTAssertEqual(centerYConstraints.count, 1)

        guard let centerXConstraint = centerXConstraints.first,
            let centerYConstraint = centerYConstraints.first else { return XCTFail() }

        testConstraint(centerXConstraint)
        testConstraint(centerYConstraint)
    }
}
