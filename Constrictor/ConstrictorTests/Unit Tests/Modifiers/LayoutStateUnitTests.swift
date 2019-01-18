//
//  LayoutStateUnitTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 15/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

// MARK: - LayoutStateUnitTests
class LayoutStateUnitTests: XCTestCase {

    // MARK: Properties
    private var view: UIView!
    private var constraint: NSLayoutConstraint!

    // MARK: Lifecycle
    override func setUp() {
        super.setUp()
        view = UIView()
        constraint = view.widthAnchor.constraint(equalTo: view.heightAnchor)
    }

    override func tearDown() {
        view = nil
        constraint = nil
        super.tearDown()
    }
}

// MARK: - Tests
extension LayoutStateUnitTests {

    // MARK: NSLayoutConstraint's Sugar
    func testConstraintEnable() {
        constraint.enable()
        XCTAssertEqual(constraint.isActive, true)
    }

    func testConstraintDisable() {
        constraint.isActive = true
        constraint.disable()
        XCTAssertEqual(constraint.isActive, false)
    }
}
