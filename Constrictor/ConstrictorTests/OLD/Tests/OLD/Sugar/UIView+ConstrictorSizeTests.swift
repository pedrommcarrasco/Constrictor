////
////  UIView+ConstrictorSizeTests.swift
////  ConstrictorTests
////
////  Created by Pedro Carrasco on 29/09/2018.
////  Copyright © 2018 Pedro Carrasco. All rights reserved.
////
//
//import XCTest
//@testable import Constrictor
//
//// MARK: - UIViewConstrictorSizeTests
//class UIViewConstrictorSizeTests: XCTestCase, ConstraintTestable {
//
//    // MARK: Constants
//    enum Constants {
//
//        static let constant: CGFloat = 50.0
//        static let multiplier: CGFloat = 0.75
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
//}
//
//// MARK: - Tests
//extension UIViewConstrictorSizeTests {
//
//    // MARK: constrictSize(as relation: NSLayoutConstraint.Relation = .equal, to item: Constrictable, with constant: Constant = .zero, ...
//    func testConstrictSizeToViewController() {
//
//        // Setup
//        viewController.view.addSubview(aView)
//        aView.constrictSize(to: viewController, multiplyBy: Constants.multiplier)
//
//        // Tests
//        let widthConstraints = viewController.view.findConstraints(for: .width, relatedTo: aView)
//        let heightConstraints = viewController.view.findConstraints(for: .height, relatedTo: aView)
//
//        XCTAssertEqual(widthConstraints.count, 1)
//        XCTAssertEqual(heightConstraints.count, 1)
//
//        guard let widthConstraint = widthConstraints.first,
//            let heightConstraint = heightConstraints.first else { return XCTFail() }
//
//        testConstraint(widthConstraint, multiplier: Constants.multiplier)
//        testConstraint(heightConstraint, multiplier: Constants.multiplier)
//    }
//
//    func testConstrictSizeToView() {
//
//        // Setup
//        viewController.view.addSubview(aView)
//        viewController.view.addSubview(bView)
//        bView.constrictSize(to: aView)
//
//        // Tests
//        let widthConstraints = viewController.view.findConstraints(for: .width, relatedTo: bView)
//        let heightConstraints = viewController.view.findConstraints(for: .height, relatedTo: bView)
//
//        XCTAssertEqual(widthConstraints.count, 1)
//        XCTAssertEqual(heightConstraints.count, 1)
//
//        guard let widthConstraint = widthConstraints.first,
//            let heightConstraint = heightConstraints.first else { return XCTFail() }
//
//        testConstraint(widthConstraint)
//        testConstraint(heightConstraint)
//    }
//
//    // MARK: constrictSize(as relation: NSLayoutConstraint.Relation = .equal, with constant: Constant, ...
//    func testConstrictSizeToConstant() {
//
//        // Setup
//        viewController.view.addSubview(aView)
//        viewController.view.addSubview(bView)
//        bView.constrictSize(to: .height(Constants.constant) & .width(Constants.constant * 2))
//
//        // Tests
//        let widthConstraints = bView.findConstraints(for: .width, at: .secondItem)
//        let heightConstraints = bView.findConstraints(for: .height, at: .secondItem)
//
//        XCTAssertEqual(widthConstraints.count, 1)
//        XCTAssertEqual(heightConstraints.count, 1)
//
//        guard let widthConstraint = widthConstraints.first,
//            let heightConstraint = heightConstraints.first else { return XCTFail() }
//
//        testConstraint(widthConstraint, constant: Constants.constant * 2)
//        testConstraint(heightConstraint, constant: Constants.constant)
//    }
//
//    // MARK: constrictSize(as relation: NSLayoutConstraint.Relation = .equal, with constant: CGFloat, ...
//    func testConstrictSizeToConstantUniform() {
//
//        // Setup
//        viewController.view.addSubview(aView)
//        viewController.view.addSubview(bView)
//        bView.constrictSize(to: Constants.constant)
//
//        // Tests
//        let widthConstraints = bView.findConstraints(for: .width, at: .secondItem)
//        let heightConstraints = bView.findConstraints(for: .height, at: .secondItem)
//
//        XCTAssertEqual(widthConstraints.count, 1)
//        XCTAssertEqual(heightConstraints.count, 1)
//
//        guard let widthConstraint = widthConstraints.first,
//            let heightConstraint = heightConstraints.first else { return XCTFail() }
//
//        testConstraint(widthConstraint, constant: Constants.constant)
//        testConstraint(heightConstraint, constant: Constants.constant)
//    }
//
//    // MARK: constrictSizeToParent(as relation: NSLayoutConstraint.Relation = .equal, with constant: Constant = .zero, ...
//    func testConstrictSizeToParent() {
//
//        // Setup
//        viewController.view.addSubview(aView)
//        aView.addSubview(bView)
//        bView.constrictSizeToParent(with: .all(Constants.constant), multiplyBy: Constants.multiplier)
//
//        // Tests
//        let widthConstraints = aView.findConstraints(for: .width, relatedTo: bView)
//        let heightConstraints = aView.findConstraints(for: .height, relatedTo: bView)
//
//        XCTAssertEqual(widthConstraints.count, 1)
//        XCTAssertEqual(heightConstraints.count, 1)
//
//        guard let widthConstraint = widthConstraints.first,
//            let heightConstraint = heightConstraints.first else { return XCTFail() }
//
//        testConstraint(widthConstraint, constant: Constants.constant, multiplier: Constants.multiplier)
//        testConstraint(heightConstraint, constant: Constants.constant, multiplier: Constants.multiplier)
//    }
//}
