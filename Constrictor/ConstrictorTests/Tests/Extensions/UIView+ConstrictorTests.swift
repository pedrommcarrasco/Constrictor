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

    // MARK: Test - constrict(_ selfAttribute: NSLayoutAttribute, ...
    func testConstrictAtEdges() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrict(.top, to: viewController.view, attribute: .top)
            .constrict(.bottom, to: viewController.view, attribute: .bottom)
            .constrict(.trailing, to: viewController.view, attribute: .trailing)
            .constrict(.leading, to: viewController.view, attribute: .leading)

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, expectedConstraintCount(based: 4, isInContainer: true))

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

    func testConstrictEdgesWithConstants() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrict(.top, to: viewController.view, attribute: .top, constant: Constants.constant)
            .constrict(.bottom, to: viewController.view, attribute: .bottom)
            .constrict(.trailing, to: viewController.view, attribute: .trailing, constant: Constants.constant)
            .constrict(.leading, to: viewController.view, attribute: .leading)

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, expectedConstraintCount(based: 4, isInContainer: true))

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
        testConstraint(trailingConstraint, constant: -Constants.constant)
        testConstraint(leadingConstraint)
    }

    func testConstrictAtTwoViewsCenterWidthHeight() {

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
        XCTAssertEqual(viewController.view.constraints.count, expectedConstraintCount(based: 5, isInContainer: true))

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

    func testConstrictAtCenterWithWidthHeightWithConstants() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrict(.centerX, to: viewController.view, attribute: .centerX, constant: Constants.constant)
            .constrict(.centerY, to: viewController.view, attribute: .centerY, constant: -Constants.constant)
            .constrict(.width, constant: Constants.constant)
            .constrict(.height, constant: Constants.constant)

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, expectedConstraintCount(based: 2, isInContainer: true))
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
        testConstraint(centerYConstraint, constant: -Constants.constant)
        testConstraint(widthConstraint, constant: Constants.constant)
        testConstraint(heightConstraint, constant: Constants.constant)
    }

    // MARK: Test - constrictToContainer(_ selfAttribute: NSLayoutAttribute, ...
    func testConstrictToContainerAtTop() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrictToContainer(attributes: .top)

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, expectedConstraintCount(based: 1, isInContainer: true))

        let topConstraints = viewController.view.findConstraints(for: .top, relatedTo: aView)

        XCTAssertEqual(topConstraints.count, 1)

        guard let topConstraint = topConstraints.first else { return XCTFail() }

        testConstraint(topConstraint)
    }

    func testConstrictToContainerAtTopBottomWithConstant() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrictToContainer(attributes: .top, .bottom, constant: Constants.constant)

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, expectedConstraintCount(based: 2, isInContainer: true))

        let topConstraints = viewController.view.findConstraints(for: .top, relatedTo: aView)
        let bottomConstraints = viewController.view.findConstraints(for: .bottom, relatedTo: aView)

        XCTAssertEqual(topConstraints.count, 1)
        XCTAssertEqual(bottomConstraints.count, 1)

        guard let topConstraint = topConstraints.first,
            let bottomConstraint = bottomConstraints.first else { return XCTFail() }

        testConstraint(topConstraint, constant: Constants.constant)
        testConstraint(bottomConstraint, constant: -Constants.constant)
    }

    func testConstrictToContainerAtTopBottomTrailingWithRelation() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrictToContainer(attributes: .top, .bottom, .trailing, relation: .lessThanOrEqual)

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, expectedConstraintCount(based: 3, isInContainer: true))

        let topConstraints = viewController.view.findConstraints(for: .top, relatedTo: aView)
        let bottomConstraints = viewController.view.findConstraints(for: .bottom, relatedTo: aView)
        let trailingConstraints = viewController.view.findConstraints(for: .trailing, relatedTo: aView)

        XCTAssertEqual(topConstraints.count, 1)
        XCTAssertEqual(bottomConstraints.count, 1)
        XCTAssertEqual(trailingConstraints.count, 1)

        guard let topConstraint = topConstraints.first,
            let bottomConstraint = bottomConstraints.first,
            let trailingConstraint = trailingConstraints.first
            else { return XCTFail() }

        testConstraint(topConstraint, relation: .lessThanOrEqual)
        testConstraint(bottomConstraint, relation: .lessThanOrEqual)
        testConstraint(trailingConstraint, relation: .lessThanOrEqual)
    }

    func testConstrictToContainerAtTopBottomTrailingLeadingWithMultiplier() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrictToContainer(attributes: .top, .bottom, .trailing, .leading, multiplier: Constants.multiplier)

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, expectedConstraintCount(based: 4, isInContainer: true))

        let topConstraints = viewController.view.findConstraints(for: .top, relatedTo: aView)
        let bottomConstraints = viewController.view.findConstraints(for: .bottom, relatedTo: aView)
        let trailingConstraints = viewController.view.findConstraints(for: .trailing, relatedTo: aView)
        let leadingConstraints = viewController.view.findConstraints(for: .leading, relatedTo: aView)

        XCTAssertEqual(topConstraints.count, 1)
        XCTAssertEqual(bottomConstraints.count, 1)
        XCTAssertEqual(trailingConstraints.count, 1)
        XCTAssertEqual(leadingConstraints.count, 1)

        guard let topConstraint = topConstraints.first,
            let bottomConstraint = bottomConstraints.first,
            let trailingConstraint = trailingConstraints.first,
            let leadingConstraint = leadingConstraints.first
            else { return XCTFail() }

        testConstraint(topConstraint, multiplier: Constants.multiplier)
        testConstraint(bottomConstraint, multiplier: Constants.multiplier)
        testConstraint(trailingConstraint, multiplier: Constants.multiplier)
        testConstraint(leadingConstraint, multiplier: Constants.multiplier)
    }

    // MARK: Test - constrict(attributes: NSLayoutAttribute ..., ..., to view: UIView?, ...
    func testConstrictAttributesToViewAtTop() {

        // Setup
        viewController.view.addSubview(aView)
        viewController.view.addSubview(bView)
        aView.constrict(attributes: .top, to: bView)

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, expectedConstraintCount(based: 1))

        let topConstraints = viewController.view.findConstraints(for: .top, relatedTo: aView)

        XCTAssertEqual(topConstraints.count, 1)

        guard let topConstraint = topConstraints.first else { return XCTFail() }

        testConstraint(topConstraint)
    }

    func testConstrictAttributesToViewAtTopBottomWithMultiplier() {

        // Setup
        viewController.view.addSubview(aView)
        viewController.view.addSubview(bView)
        aView.constrict(attributes: .top, .bottom , to: bView, multiplier: Constants.multiplier)

        // Tests
        XCTAssertEqual(viewController.view.constraints.count, expectedConstraintCount(based: 2))

        let topConstraints = viewController.view.findConstraints(for: .top, relatedTo: aView)
        let bottomConstraints = viewController.view.findConstraints(for: .bottom, relatedTo: aView)

        XCTAssertEqual(topConstraints.count, 1)
        XCTAssertEqual(bottomConstraints.count, 1)

        guard let topConstraint = topConstraints.first,
            let bottomConstraint = bottomConstraints.first
            else { return XCTFail() }

        testConstraint(topConstraint, multiplier: Constants.multiplier)
        testConstraint(bottomConstraint, multiplier: Constants.multiplier)
    }

    func testConstrictAttributesToViewAtWidthHeightWithConstantsRelation() {

        // Setup
        viewController.view.addSubview(aView)
        viewController.view.addSubview(bView)
        aView.constrict(attributes: .width, .height, relation: .greaterThanOrEqual, constant: Constants.constant)

        // Tests
        XCTAssertEqual(aView.constraints.count, expectedConstraintCount(based: 2))

        let widthConstraints = aView.findConstraints(for: .width, at: .secondItem)
        let heightConstraints = aView.findConstraints(for: .height, at: .secondItem)

        XCTAssertEqual(widthConstraints.count, 1)
        XCTAssertEqual(heightConstraints.count, 1)

        guard let widthConstraint = widthConstraints.first,
            let heightConstraint = heightConstraints.first
            else { return XCTFail() }

        testConstraint(widthConstraint, constant: Constants.constant, relation: .greaterThanOrEqual)
        testConstraint(heightConstraint, constant: Constants.constant, relation: .greaterThanOrEqual)
    }
}
