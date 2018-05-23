//
//  UIView+ConstrictorTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 23/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

class UIViewConstrictorTests: XCTestCase {

    // MARK: Constants
    enum Constants {

        static let defaultConstant: CGFloat = 0.0
        static let defaultMultiplier: CGFloat = 1.0
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

    // MARK: Test
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
}

private extension UIViewConstrictorTests {

    func testConstraint(_ constraint: NSLayoutConstraint,
                        constant: CGFloat = Constants.defaultConstant,
                        multiplier: CGFloat = Constants.defaultMultiplier,
                        relation: NSLayoutRelation = .equal,
                        isActive: Bool = true) {

        XCTAssertEqual(constraint.constant, constant)
        XCTAssertEqual(constraint.isActive, isActive)
        XCTAssertEqual(constraint.multiplier, multiplier)
        XCTAssertEqual(constraint.relation, relation)
    }
}
