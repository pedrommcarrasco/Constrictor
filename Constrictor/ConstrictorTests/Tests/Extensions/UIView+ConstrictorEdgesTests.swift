//
//  UIView+ConstrictorEdgesTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 24/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest

class UIViewConstrictorEdgesTests: XCTestCase, ConstraintTestable {

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

    // MARK: Test - constrictEdgesToViewController(_ viewController: UIViewController, relation: NSLayoutRelation = .equal,
    func testConstrictEdgesToViewControllerGuided() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrictEdgesToController(viewController)

        // Tests
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

    func testConstrictEdgesToViewControllerNotGuided() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrictEdgesToController(viewController, withinGuides: false)

        // Tests
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

    // MARK: Test - constrictEdgesToSuperview(_ relation: NSLayoutRelation = .equal, constant: CGFloat = 0.0, ...
    func testConstrictEdgesToSuperViewGuided() {

        // Setup
        viewController.view.addSubview(aView)
        aView.addSubview(bView)
        bView.constrictEdgesToParent()

        // Tests
        let topConstraints = aView.findConstraints(for: .top, relatedTo: bView)
        let bottomConstraints = aView.findConstraints(for: .bottom, relatedTo: bView)
        let leadingConstraints = aView.findConstraints(for: .leading, relatedTo: bView)
        let trailingConstraints = aView.findConstraints(for: .trailing, relatedTo: bView)

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

    func testConstrictEdgesToSuperViewNotGuided() {

        // Setup
        viewController.view.addSubview(aView)
        aView.addSubview(bView)
        bView.constrictEdgesToParent(withinGuides: false)

        // Tests
        let topConstraints = aView.findConstraints(for: .top, relatedTo: bView)
        let bottomConstraints = aView.findConstraints(for: .bottom, relatedTo: bView)
        let leadingConstraints = aView.findConstraints(for: .leading, relatedTo: bView)
        let trailingConstraints = aView.findConstraints(for: .trailing, relatedTo: bView)

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

    // MARK: Test - constrictEdges(_ relation: NSLayoutRelation = .equal, to item: Constrictable, ...
    func testConstrictEdgesGuided() {

        // Setup
        viewController.view.addSubview(aView)
        viewController.view.addSubview(bView)
        aView.constrictEdges(to: bView)

        // Tests
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
}
