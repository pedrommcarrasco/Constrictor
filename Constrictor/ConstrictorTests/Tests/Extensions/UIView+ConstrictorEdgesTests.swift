////
////  UIView+ConstrictorEdgesTests.swift
////  ConstrictorTests
////
////  Created by Pedro Carrasco on 24/05/2018.
////  Copyright © 2018 Pedro Carrasco. All rights reserved.
////
//
//import XCTest
//
//class UIViewConstrictorEdgesTests: XCTestCase, ConstraintTestable {
//    
//    // MARK: Constants
//    enum Constants {
//
//        static let constant: CGFloat = 50.0
//        static let multiplier: CGFloat = 0.5
//    }
//
//    // MARK: Properties
//    var viewController: UIViewController!
//    var aView: UIView!
//    var bView: UIView!
//
//    // MARK: Lifecycle
//    override func setUp() {
//        super.setUp()
//
//        aView = UIView()
//        bView = UIView()
//
//        viewController = UIViewController()
//        viewController.loadViewIfNeeded()
//    }
//
//    override func tearDown() {
//
//        aView = nil
//        bView = nil
//
//        super.tearDown()
//    }
//
//    // MARK: Test - constrictCenterToContainer(...)
//    func testConstrictEdgesToContainer() {
//
//        // Setup
//        viewController.view.addSubview(aView)
//        aView.constrictEdgesToContainer()
//
//        // Tests
//        XCTAssertEqual(viewController.view.constraints.count, expectedConstraintCount(based: 4, isInContainer: true))
//
//        let topConstraints = viewController.view.findConstraints(for: .top, relatedTo: aView)
//        let bottomConstraints = viewController.view.findConstraints(for: .bottom, relatedTo: aView)
//        let leadingConstraints = viewController.view.findConstraints(for: .leading, relatedTo: aView)
//        let trailingConstraints = viewController.view.findConstraints(for: .trailing, relatedTo: aView)
//
//        XCTAssertEqual(topConstraints.count, 1)
//        XCTAssertEqual(bottomConstraints.count, 1)
//        XCTAssertEqual(leadingConstraints.count, 1)
//        XCTAssertEqual(trailingConstraints.count, 1)
//
//        guard let topConstraint = topConstraints.first,
//            let bottomConstraint = bottomConstraints.first,
//            let leadingConstraint = leadingConstraints.first,
//            let trailingConstraint = trailingConstraints.first
//            else { return XCTFail() }
//
//        testConstraint(topConstraint)
//        testConstraint(bottomConstraint)
//        testConstraint(leadingConstraint)
//        testConstraint(trailingConstraint)
//    }
//
//    func testConstrictEdgesToContainerWithConstantRelationMultiplier() {
//
//        // Setup
//        viewController.view.addSubview(aView)
//        aView.constrictEdgesToContainer(relation: .greaterThanOrEqual,
//                                        constant: Constants.constant,
//                                        multiplier: Constants.multiplier)
//
//        // Tests
//        XCTAssertEqual(viewController.view.constraints.count, expectedConstraintCount(based: 4, isInContainer: true))
//
//        let topConstraints = viewController.view.findConstraints(for: .top, relatedTo: aView)
//        let bottomConstraints = viewController.view.findConstraints(for: .bottom, relatedTo: aView)
//        let leadingConstraints = viewController.view.findConstraints(for: .leading, relatedTo: aView)
//        let trailingConstraints = viewController.view.findConstraints(for: .trailing, relatedTo: aView)
//
//        XCTAssertEqual(topConstraints.count, 1)
//        XCTAssertEqual(bottomConstraints.count, 1)
//        XCTAssertEqual(leadingConstraints.count, 1)
//        XCTAssertEqual(trailingConstraints.count, 1)
//
//        guard let topConstraint = topConstraints.first,
//            let bottomConstraint = bottomConstraints.first,
//            let leadingConstraint = leadingConstraints.first,
//            let trailingConstraint = trailingConstraints.first
//            else { return XCTFail() }
//
//        testConstraint(topConstraint, constant: Constants.constant, multiplier: Constants.multiplier, relation: .greaterThanOrEqual)
//        testConstraint(bottomConstraint, constant: -Constants.constant, multiplier: Constants.multiplier, relation: .greaterThanOrEqual)
//        testConstraint(leadingConstraint, constant: Constants.constant, multiplier: Constants.multiplier, relation: .greaterThanOrEqual)
//        testConstraint(trailingConstraint, constant: -Constants.constant, multiplier: Constants.multiplier, relation: .greaterThanOrEqual)
//    }
//
//    // MARK: Test - constrictEdges(to view: UIView, ...)
//    func testConstrictEdgesToView() {
//
//        // Setup
//        viewController.view.addSubview(aView)
//        viewController.view.addSubview(bView)
//        aView.constrictEdges(to: bView)
//
//        // Tests
//        XCTAssertEqual(viewController.view.constraints.count, expectedConstraintCount(based: 4))
//
//        let topConstraints = viewController.view.findConstraints(for: .top, relatedTo: aView)
//        let bottomConstraints = viewController.view.findConstraints(for: .bottom, relatedTo: aView)
//        let leadingConstraints = viewController.view.findConstraints(for: .leading, relatedTo: aView)
//        let trailingConstraints = viewController.view.findConstraints(for: .trailing, relatedTo: aView)
//
//        XCTAssertEqual(topConstraints.count, 1)
//        XCTAssertEqual(bottomConstraints.count, 1)
//        XCTAssertEqual(leadingConstraints.count, 1)
//        XCTAssertEqual(trailingConstraints.count, 1)
//
//        guard let topConstraint = topConstraints.first,
//            let bottomConstraint = bottomConstraints.first,
//            let leadingConstraint = leadingConstraints.first,
//            let trailingConstraint = trailingConstraints.first
//            else { return XCTFail() }
//
//        testConstraint(topConstraint)
//        testConstraint(bottomConstraint)
//        testConstraint(leadingConstraint)
//        testConstraint(trailingConstraint)
//    }
//
//    func testConstrictEdgesToViewWithConstantRelationMultiplier() {
//
//        // Setup
//        viewController.view.addSubview(aView)
//        viewController.view.addSubview(bView)
//        aView.constrictEdges(to: bView,
//                             relation: .greaterThanOrEqual,
//                             constant: Constants.constant,
//                             multiplier: Constants.multiplier)
//
//        // Tests
//        XCTAssertEqual(viewController.view.constraints.count, expectedConstraintCount(based: 4))
//
//        let topConstraints = viewController.view.findConstraints(for: .top, relatedTo: aView)
//        let bottomConstraints = viewController.view.findConstraints(for: .bottom, relatedTo: aView)
//        let leadingConstraints = viewController.view.findConstraints(for: .leading, relatedTo: aView)
//        let trailingConstraints = viewController.view.findConstraints(for: .trailing, relatedTo: aView)
//
//        XCTAssertEqual(topConstraints.count, 1)
//        XCTAssertEqual(bottomConstraints.count, 1)
//        XCTAssertEqual(leadingConstraints.count, 1)
//        XCTAssertEqual(trailingConstraints.count, 1)
//
//        guard let topConstraint = topConstraints.first,
//            let bottomConstraint = bottomConstraints.first,
//            let leadingConstraint = leadingConstraints.first,
//            let trailingConstraint = trailingConstraints.first
//            else { return XCTFail() }
//
//        testConstraint(topConstraint, constant: Constants.constant, multiplier: Constants.multiplier, relation: .greaterThanOrEqual)
//        testConstraint(bottomConstraint, constant: -Constants.constant, multiplier: Constants.multiplier, relation: .greaterThanOrEqual)
//        testConstraint(leadingConstraint, constant: Constants.constant, multiplier: Constants.multiplier, relation: .greaterThanOrEqual)
//        testConstraint(trailingConstraint, constant: -Constants.constant, multiplier: Constants.multiplier, relation: .greaterThanOrEqual)
//    }
//}
