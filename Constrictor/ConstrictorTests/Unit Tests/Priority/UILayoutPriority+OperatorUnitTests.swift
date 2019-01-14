//
//  UILayoutPriority+OperatorUnitTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 14/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

// MARK: - UILayoutPriorityOperatorUnitTests
class UILayoutPriorityOperatorUnitTests: XCTestCase {

    // MARK: ExpectedResults
    private enum ExpectedResults {
        static let addPriority = UILayoutPriority(751.0)
        static let substractPriority = UILayoutPriority(749.0)
    }
}

// MARK: - Tests
extension UILayoutPriorityOperatorUnitTests {

    // MARK: Operators
    func testOperators() {
        let expectedResults = [ExpectedResults.addPriority, ExpectedResults.substractPriority]
        let results = [UILayoutPriority.defaultHigh + 1, UILayoutPriority.defaultHigh - 1]

        zip(results, expectedResults).forEach { result, expected in
            XCTAssertEqual(result, expected)
        }
    }
}

