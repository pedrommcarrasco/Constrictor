//
//  NSLayoutConstraintSetUnitTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 12/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

// MARK: - NSLayoutConstraintSetUnitTests
final class NSLayoutConstraintSetUnitTests: XCTestCase {
    
    // MARK: Constant
    private enum Constant {
        static let constant: CGFloat = 6
        static let priority: UILayoutPriority = .defaultHigh
        static let isActive: Bool = false
    }
    
    // MARK: Properties
    private var constraint: NSLayoutConstraint!
    
    // MARK: Lifecycle
    override func setUp() {
        super.setUp()
        constraint = NSLayoutConstraint()
    }
    
    override func tearDown() {
        constraint = nil
        super.tearDown()
    }
}

// MARK: - Tests
extension NSLayoutConstraintSetUnitTests {
    
    // MARK: Set
    func testSet() {
        constraint.set(constant: Constant.constant, priority: Constant.priority, isActive: Constant.isActive)
        XCTAssertEqual(constraint.constant, Constant.constant)
        XCTAssertEqual(constraint.priority, Constant.priority)
        XCTAssertEqual(constraint.isActive, Constant.isActive)
    }
}
