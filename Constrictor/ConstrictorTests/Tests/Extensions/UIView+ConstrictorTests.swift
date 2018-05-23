//
//  UIView+ConstrictorTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 23/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

class UIViewConstrictorTests: XCTestCase, ConstraintTestable {

    // MARK: Constants
    enum Constants {

        static let constant: CGFloat = 50.0
        static let invertedConstant: CGFloat = -50.0
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

    // MARK: Test - constrict(_ selfAttribute: NSLayoutAttribute, ...
    func testConstrictCore() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrict(.top, to: viewController.view, attribute: .top)
            .constrict(.bottom, to: viewController.view, attribute: .bottom)
            .constrict(.trailing, to: viewController.view, attribute: .trailing)
            .constrict(.leading, to: viewController.view, attribute: .leading)

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

    func testConstrictCoreTwo() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrict(.top, to: viewController.view, attribute: .top, constant: Constants.constant)
            .constrict(.bottom, to: viewController.view, attribute: .bottom)
            .constrict(.trailing, to: viewController.view, attribute: .trailing, constant: Constants.constant)
            .constrict(.leading, to: viewController.view, attribute: .leading)

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
        testConstraint(bottomConstraint)
        testConstraint(trailingConstraint, constant: Constants.invertedConstant)
        testConstraint(leadingConstraint)
    }

    func testConstrictCoreThree() {

        // Setup aView
        viewController.view.addSubview(aView)
        aView.constrict(.centerX, to: viewController.view, attribute: .centerX)
            .constrict(.centerY, to: viewController.view, attribute: .centerY)
            .constrict(.width, constant: Constants.constant)
            .constrict(.height, constant: Constants.constant)

        // Setup bView
        viewController.view.addSubview(bView)
        bView.constrict(.centerY, to: aView, attribute: .centerY)
            .constrict(.width, to: aView, attribute: .width)
            .constrict(.height, constant: Constants.constant)
            .constrict(.trailing, relation: .greaterThanOrEqual, to: aView, attribute: .leading, constant: Constants.constant)

        // Test aView
        XCTAssertEqual(viewController.view.constraints.count, 5)
        XCTAssertEqual(aView.constraints.count, 2)
        XCTAssertEqual(bView.constraints.count, 1)

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
        testConstraint(bTrailingConstraint, constant: Constants.invertedConstant, relation: .greaterThanOrEqual)
    }

    func testConstrictCoreFour() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrict(.centerX, to: viewController.view, attribute: .centerX, constant: Constants.constant)
            .constrict(.centerY, to: viewController.view, attribute: .centerY, constant: Constants.invertedConstant)
            .constrict(.width, constant: Constants.constant)
            .constrict(.height, constant: Constants.constant)

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, 2)
        XCTAssertEqual(aView.constraints.count, 2)

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
        testConstraint(centerYConstraint, constant: Constants.invertedConstant)
        testConstraint(widthConstraint, constant: Constants.constant)
        testConstraint(heightConstraint, constant: Constants.constant)
    }
}
