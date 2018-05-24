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
    
    // MARK: Test - constrictCenterInContainer(...)
    func testConstrictCenterInContainer() {
        
        // Setup
        viewController.view.addSubview(aView)
        aView.constrictCenterInContainer()
        
        // Tests
        XCTAssertEqual(viewController.view.constraints.count, 2)
        
        let centerXConstraints = viewController.view.findConstraints(for: .centerX, relatedTo: aView)
        let centerYConstraints = viewController.view.findConstraints(for: .centerY, relatedTo: aView)
        
        XCTAssertEqual(centerXConstraints.count, 1)
        XCTAssertEqual(centerYConstraints.count, 1)
        
        guard let centerXConstraint = centerXConstraints.first,
            let centerYConstraint = centerYConstraints.first else { return XCTFail() }
        
        testConstraint(centerXConstraint)
        testConstraint(centerYConstraint)
    }
    
    func testConstrictCenterInContainerWithConstant() {
        
        // Setup
        viewController.view.addSubview(aView)
        aView.constrictCenterInContainer(constant: Constants.constant)
        
        // Tests
        XCTAssertEqual(viewController.view.constraints.count, 2)
        
        let centerXConstraints = viewController.view.findConstraints(for: .centerX, relatedTo: aView)
        let centerYConstraints = viewController.view.findConstraints(for: .centerY, relatedTo: aView)
        
        XCTAssertEqual(centerXConstraints.count, 1)
        XCTAssertEqual(centerYConstraints.count, 1)
        
        guard let centerXConstraint = centerXConstraints.first,
            let centerYConstraint = centerYConstraints.first else { return XCTFail() }
        
        testConstraint(centerXConstraint, constant: Constants.constant)
        testConstraint(centerYConstraint, constant: Constants.constant)
    }
    
    func testConstrictCenterInContainerWithRelation() {
        
        // Setup
        viewController.view.addSubview(aView)
        aView.constrictCenterInContainer(relation: .lessThanOrEqual)
        
        // Tests
        XCTAssertEqual(viewController.view.constraints.count, 2)
        
        let centerXConstraints = viewController.view.findConstraints(for: .centerX, relatedTo: aView)
        let centerYConstraints = viewController.view.findConstraints(for: .centerY, relatedTo: aView)
        
        XCTAssertEqual(centerXConstraints.count, 1)
        XCTAssertEqual(centerYConstraints.count, 1)
        
        guard let centerXConstraint = centerXConstraints.first,
            let centerYConstraint = centerYConstraints.first else { return XCTFail() }
        
        testConstraint(centerXConstraint, relation: .lessThanOrEqual)
        testConstraint(centerYConstraint, relation: .lessThanOrEqual)
    }

    // MARK: Test - constrictCenter(to view: UIView,...)
    func testConstrictCenter() {

        // Setup
        viewController.view.addSubview(aView)
        viewController.view.addSubview(bView)

        bView.constrictCenter(to: aView)

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, 2)

        let centerXConstraints = viewController.view.findConstraints(for: .centerX, relatedTo: bView)
        let centerYConstraints = viewController.view.findConstraints(for: .centerY, relatedTo: bView)

        XCTAssertEqual(centerXConstraints.count, 1)
        XCTAssertEqual(centerYConstraints.count, 1)

        guard let centerXConstraint = centerXConstraints.first,
            let centerYConstraint = centerYConstraints.first else { return XCTFail() }

        testConstraint(centerXConstraint)
        testConstraint(centerYConstraint)
    }

    func testConstrictCenterWithConstant() {

        // Setup
        viewController.view.addSubview(aView)
        viewController.view.addSubview(bView)

        bView.constrictCenter(to: aView, constant: Constants.constant)

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, 2)

        let centerXConstraints = viewController.view.findConstraints(for: .centerX, relatedTo: bView)
        let centerYConstraints = viewController.view.findConstraints(for: .centerY, relatedTo: bView)

        XCTAssertEqual(centerXConstraints.count, 1)
        XCTAssertEqual(centerYConstraints.count, 1)

        guard let centerXConstraint = centerXConstraints.first,
            let centerYConstraint = centerYConstraints.first else { return XCTFail() }

        testConstraint(centerXConstraint, constant: Constants.constant)
        testConstraint(centerYConstraint, constant: Constants.constant)
    }

    func testConstrictCenterWithRelation() {

        // Setup
        viewController.view.addSubview(aView)
        viewController.view.addSubview(bView)

        bView.constrictCenter(to: aView, relation: .greaterThanOrEqual)

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, 2)

        let centerXConstraints = viewController.view.findConstraints(for: .centerX, relatedTo: bView)
        let centerYConstraints = viewController.view.findConstraints(for: .centerY, relatedTo: bView)

        XCTAssertEqual(centerXConstraints.count, 1)
        XCTAssertEqual(centerYConstraints.count, 1)

        guard let centerXConstraint = centerXConstraints.first,
            let centerYConstraint = centerYConstraints.first else { return XCTFail() }

        testConstraint(centerXConstraint, relation: .greaterThanOrEqual)
        testConstraint(centerYConstraint, relation: .greaterThanOrEqual)
    }
}
