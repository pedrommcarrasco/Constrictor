//
//  UIView+ConstrictorEdgesTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 24/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest

// MARK: - UIViewConstrictorEdgesTests
class UIViewConstrictorEdgesTests: XCTestCase, ConstraintTestable {

    // MARK: Constants
    private enum Constants {
        static let constant: CGFloat = 50.0
        static let multiplier: CGFloat = 0.5
    }

    // MARK: Properties
    private var viewController: UIViewController!
    private var aView: UIView!
    private var bView: UIView!

    // MARK: Lifecycle
    override func setUp() {
        super.setUp()

        aView = UIView()
        bView = UIView()

        viewController = UIViewController()
        viewController.loadViewIfNeeded()
    }
}

// MARK: - Tests
extension UIViewConstrictorEdgesTests {

    // MARK: constrictEdgesToViewController(_ viewController: UIViewController, relation: NSLayoutConstraint.Relation = .equal,
    func testConstrictEdgesToViewControllerGuided() {

        // Setup
        viewController.view.addSubview(aView)
        aView.constrictEdges(to: viewController)

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
        aView.constrictEdges(to: viewController, withinGuides: false)

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

    // MARK: constrictEdgesToSuperview(_ relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0.0, ...
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

    // MARK: constrictEdges(_ relation: NSLayoutConstraint.Relation = .equal, to item: Constrictable, ...
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
