////
////  UIView+ConstrictorTests.swift
////  ConstrictorTests
////
////  Created by Pedro Carrasco on 23/05/2018.
////  Copyright © 2018 Pedro Carrasco. All rights reserved.
////

import XCTest
@testable import Constrictor

class UIViewConstrictorTests: XCTestCase, ConstraintTestable {

    // MARK: Constants
    enum Constants {

        static let constant: CGFloat = 50.0
        static let multiplier: CGFloat = 0.5
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

    // MARK: Test - constrict(_ relation: NSLayoutRelation = .equal, to item: Constrictable? = nil, ...
    func testConstrictAtEdges() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrict(.top, to: viewController, attribute: .top, with: Constants.constant)
            .constrict(.bottom, to: viewController, attribute: .bottom, multipliedBy: Constants.multiplier)
            .constrict(.trailing, as: .greaterThanOrEqual, to: viewController, attribute: .trailing)
            .constrict(.leading, to: viewController, attribute: .leading)

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, 4)

        let topConstraints = viewController.view.findConstraints(for: .top, relatedTo: aView)
        let bottomConstraints = viewController.view.findConstraints(for: .bottom, relatedTo: aView)
        let leadingConstraints = viewController.view.findConstraints(for: .leading, relatedTo: aView)
        let trailingConstraints = viewController.view.findConstraints(for: .trailing, relatedTo: aView)

        XCTAssertEqual(topConstraints.count, 1)
        XCTAssertEqual(bottomConstraints.count, 1)
        XCTAssertEqual(leadingConstraints.count, 1)
        XCTAssertEqual(trailingConstraints.count, 1)

        guard let topConstraint = topConstraints.first,
            let bottomConstraint = bottomConstraints.first,
            let leadingConstraint = leadingConstraints.first,
            let trailingConstraint = trailingConstraints.first
            else { return XCTFail() }

        testConstraint(topConstraint, constant: Constants.constant)
        testConstraint(bottomConstraint, multiplier: Constants.multiplier)
        testConstraint(leadingConstraint)
        testConstraint(trailingConstraint, relation: .greaterThanOrEqual)
    }

    func testConstrictAtEdgesGuides() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrict(.topGuide, to: viewController, attribute: .top)
            .constrict(.bottomGuide, to: viewController, attribute: .bottom)
            .constrict(.trailingGuide, to: viewController, attribute: .trailing)
            .constrict(.leadingGuide, to: viewController, attribute: .leading)

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, 4)

        let topConstraints = viewController.view.findConstraints(for: .top, relatedTo: aView)
        let bottomConstraints = viewController.view.findConstraints(for: .bottom, relatedTo: aView)
        let leadingConstraints = viewController.view.findConstraints(for: .leading, relatedTo: aView)
        let trailingConstraints = viewController.view.findConstraints(for: .trailing, relatedTo: aView)

        XCTAssertEqual(topConstraints.count, 1)
        XCTAssertEqual(bottomConstraints.count, 1)
        XCTAssertEqual(leadingConstraints.count, 1)
        XCTAssertEqual(trailingConstraints.count, 1)

        guard let topConstraint = topConstraints.first,
            let bottomConstraint = bottomConstraints.first,
            let leadingConstraint = leadingConstraints.first,
            let trailingConstraint = trailingConstraints.first
            else { return XCTFail() }

        testConstraint(topConstraint)
        testConstraint(bottomConstraint)
        testConstraint(leadingConstraint)
        testConstraint(trailingConstraint)
    }

    func testConstrictAtTwoViewsCenterWidthHeight() {

        // Setup aView
        viewController.view.addSubview(aView)
        aView.constrict(.centerX, to: viewController, attribute: .centerX, with: Constants.constant)
            .constrict(.centerY, to: viewController, attribute: .centerY)
            .constrict(.width, with: Constants.constant)
            .constrict(.height, with: Constants.constant)

        // Setup bView
        viewController.view.addSubview(bView)
        bView.constrict(.centerY, to: aView, attribute: .centerY)
            .constrict(.width, to: aView, attribute: .width)
            .constrict(.height, with: Constants.constant)
            .constrict(.trailing, as: .greaterThanOrEqual, to: aView, attribute: .leading, with: Constants.constant)

        // Test aView
        XCTAssertEqual(viewController.view.constraints.count, 5)

        let centerXConstraints = viewController.view.findConstraints(for: .centerX, relatedTo: aView)
        let centerYConstraints = viewController.view.findConstraints(for: .centerY, relatedTo: aView)
        let widthConstraints = aView.findConstraints(for: .width, at: .secondItem)
        let heightConstraints = aView.findConstraints(for: .height, at: .secondItem)
        
        XCTAssertEqual(centerXConstraints.count, 1)
        XCTAssertEqual(centerYConstraints.count, 1)
        XCTAssertEqual(widthConstraints.count, 1)
        XCTAssertEqual(heightConstraints.count, 1)

        guard let centerXConstraint = centerXConstraints.first,
            let centerYConstraint = centerYConstraints.first,
            let widthConstraint = widthConstraints.first,
            let heightConstraint = heightConstraints.first
            else { return XCTFail() }

        testConstraint(centerXConstraint, constant: Constants.constant)
        testConstraint(centerYConstraint)
        testConstraint(widthConstraint, constant: Constants.constant)
        testConstraint(heightConstraint, constant: Constants.constant)

        // Test bView
        let bCenterYConstraints = viewController.view.findConstraints(for: .centerY, relatedTo: bView)
        let bWidthConstraints = viewController.view.findConstraints(for: .width, relatedTo: bView, at: .firstItem)
        let bHeightConstraints = bView.findConstraints(for: .height, at: .secondItem)
        let bTrailingConstraints = viewController.view.findConstraints(for: .trailing, relatedTo: bView)

        XCTAssertEqual(bCenterYConstraints.count, 1)
        XCTAssertEqual(bWidthConstraints.count, 1)
        XCTAssertEqual(bHeightConstraints.count, 1)
        XCTAssertEqual(bTrailingConstraints.count, 1)

        guard let bCenterYConstraint = bCenterYConstraints.first,
            let bWidthConstraint = bWidthConstraints.first,
            let bHeightConstraint = bHeightConstraints.first,
            let bTrailingConstraint = bTrailingConstraints.first
            else { return XCTFail() }

        testConstraint(bCenterYConstraint)
        testConstraint(bWidthConstraint)
        testConstraint(bHeightConstraint, constant: Constants.constant)
        testConstraint(bTrailingConstraint, constant: -Constants.constant, relation: .greaterThanOrEqual)
    }
    
    func testConstrictAtTwoViewsCenterWidthHeightWithGuides() {
        
        // Setup aView
        viewController.view.addSubview(aView)
        aView.constrict(.centerX, to: viewController, attribute: .centerXGuide)
            .constrict(.centerY, to: viewController, attribute: .centerY)
            .constrict(.width, with: Constants.constant)
            .constrict(.height, with: Constants.constant)
        
        // Setup bView
        viewController.view.addSubview(bView)
        bView.constrict(.centerY, to: aView, attribute: .centerY)
            .constrict(.width, to: aView, attribute: .width)
            .constrict(.height, with: Constants.constant)
            .constrict(.trailing, relation: .greaterThanOrEqual, to: aView, attribute: .leading, constant: .trailing(Constants.constant))

        // Test aView

        let centerXConstraints = viewController.view.findConstraints(for: .centerX, relatedTo: aView)
        let centerYConstraints = viewController.view.findConstraints(for: .centerY, relatedTo: aView)
        let widthConstraints = aView.findConstraints(for: .width, at: .secondItem)
        let heightConstraints = aView.findConstraints(for: .height, at: .secondItem)
        
        XCTAssertEqual(centerXConstraints.count, 1)
        XCTAssertEqual(centerYConstraints.count, 1)
        XCTAssertEqual(widthConstraints.count, 1)
        XCTAssertEqual(heightConstraints.count, 1)
        
        guard let centerXConstraint = centerXConstraints.first,
            let centerYConstraint = centerYConstraints.first,
            let widthConstraint = widthConstraints.first,
            let heightConstraint = heightConstraints.first
            else { return XCTFail() }
        
        testConstraint(centerXConstraint)
        testConstraint(centerYConstraint)
        testConstraint(widthConstraint, constant: Constants.constant)
        testConstraint(heightConstraint, constant: Constants.constant)
        
        // Test bView
        let bCenterYConstraints = viewController.view.findConstraints(for: .centerY, relatedTo: bView)
        let bWidthConstraints = viewController.view.findConstraints(for: .width, relatedTo: bView, at: .firstItem)
        let bHeightConstraints = bView.findConstraints(for: .height, at: .secondItem)
        let bTrailingConstraints = viewController.view.findConstraints(for: .trailing, relatedTo: bView)
        
        XCTAssertEqual(bCenterYConstraints.count, 1)
        XCTAssertEqual(bWidthConstraints.count, 1)
        XCTAssertEqual(bHeightConstraints.count, 1)
        XCTAssertEqual(bTrailingConstraints.count, 1)
        
        guard let bCenterYConstraint = bCenterYConstraints.first,
            let bWidthConstraint = bWidthConstraints.first,
            let bHeightConstraint = bHeightConstraints.first,
            let bTrailingConstraint = bTrailingConstraints.first
            else { return XCTFail() }
        
        testConstraint(bCenterYConstraint)
        testConstraint(bWidthConstraint)
        testConstraint(bHeightConstraint, constant: Constants.constant)
        testConstraint(bTrailingConstraint, constant: -Constants.constant, relation: .greaterThanOrEqual)
    }

    // MARK: Test - constrictToViewController(_ viewController: UIViewController, relation: NSLayoutRelation = .equal, attributes: ConstrictorAttribute ..., ...
    func testConstrictToViewControllerAtTopBottomConstant() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrictToController(viewController, to: .top, .bottom, with: .top(Constants.constant) & .bottom(Constants.constant))

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, 2)

        let topConstraints = viewController.view.findConstraints(for: .top, relatedTo: aView)
        let bottomConstraints = viewController.view.findConstraints(for: .bottom, relatedTo: aView)

        XCTAssertEqual(topConstraints.count, 1)
        XCTAssertEqual(bottomConstraints.count, 1)

        guard let topConstraint = topConstraints.first,
            let bottomConstraint = bottomConstraints.first else { return XCTFail() }

        testConstraint(topConstraint, constant: Constants.constant)
        testConstraint(bottomConstraint, constant: -Constants.constant)
    }
    
    func testConstrictToViewControllerAtTopBottomGuidesMultiplier() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrictToController(viewController, to: .topGuide, .leadingGuide, multipliedBy: Constants.multiplier)

        // Tests
        let topConstraints = viewController.view.findConstraints(for: .top, relatedTo: aView)
        let leadingConstraints = viewController.view.findConstraints(for: .leading, relatedTo: aView)

        XCTAssertEqual(topConstraints.count, 1)
        XCTAssertEqual(leadingConstraints.count, 1)

        XCTAssertEqual(topConstraints.count, 1)

        guard let topConstraint = topConstraints.first, let leadingConstraint = leadingConstraints.first else { return XCTFail() }

        testConstraint(topConstraint, multiplier: Constants.multiplier)
        testConstraint(leadingConstraint, multiplier: Constants.multiplier)
    }

    // MARK: Test - constrictToSuperView(_ relation: NSLayoutRelation = .equal, attributes: ConstrictorAttribute ..., ...
    func testConstrictToSuperviewAtTopBottomConstant() {

        // Setup
        viewController.view.addSubview(aView)
        aView.addSubview(bView)
        bView.constrictToParent(attributes: .top, .bottom, constant: .top(Constants.constant) & .bottom(Constants.constant))

        // Tests
        let topConstraints = aView.findConstraints(for: .top, relatedTo: bView)
        let bottomConstraints = aView.findConstraints(for: .bottom, relatedTo: bView)

        XCTAssertEqual(topConstraints.count, 1)
        XCTAssertEqual(bottomConstraints.count, 1)

        guard let topConstraint = topConstraints.first,
            let bottomConstraint = bottomConstraints.first else { return XCTFail() }

        testConstraint(topConstraint, constant: Constants.constant)
        testConstraint(bottomConstraint, constant: -Constants.constant)
    }

    func testConstrictToViewSuperviewAtTopBottomGuidesMultiplier() {

        // Setup
        viewController.view.addSubview(aView)
        aView.addSubview(bView)
        bView.constrictToParent(attributes: .topGuide, .bottomGuide, multipliedBy: Constants.multiplier)

        // Tests
        let topConstraints = aView.findConstraints(for: .top, relatedTo: bView)
        let bottomConstraints = aView.findConstraints(for: .bottom, relatedTo: bView)

        XCTAssertEqual(topConstraints.count, 1)
        XCTAssertEqual(bottomConstraints.count, 1)

        guard let topConstraint = topConstraints.first,
            let bottomConstraint = bottomConstraints.first else { return XCTFail() }

        testConstraint(topConstraint, multiplier: Constants.multiplier)
        testConstraint(bottomConstraint, multiplier: Constants.multiplier)
    }

    // MARK: Test - constrict(_ relation: NSLayoutRelation = .equal, to item: Constrictable? = nil
    func testConstrictWidthHeight() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrict(attributes: .width, .height, with: .width(Constants.constant) & .height(Constants.constant))

        // Tests
        let widthConstraints = aView.findConstraints(for: .width, relatedTo: aView)
        let heightConstraints = aView.findConstraints(for: .height, relatedTo: aView)

        XCTAssertEqual(widthConstraints.count, 1)
        XCTAssertEqual(heightConstraints.count, 1)

        guard let widthConstraint = widthConstraints.first,
            let heightConstraint = heightConstraints.first else { return XCTFail() }

        testConstraint(widthConstraint, constant: Constants.constant)
        testConstraint(heightConstraint, constant: Constants.constant)
    }
}
