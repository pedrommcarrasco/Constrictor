//
//  LayoutPriorityUnitTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 14/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

// MARK: - LayoutPriorityUnitTests
class LayoutPriorityUnitTests: XCTestCase {

    // MARK: ExpectedResults
    private enum ExpectedResults {
        static let addPriority = LayoutPriority(751.0)
        static let substractPriority = LayoutPriority(749.0)
    }
}

// MARK: - Tests
extension LayoutPriorityUnitTests {

    // MARK: Operators
    func testOperators() {
        let expectedResults = [ExpectedResults.addPriority, ExpectedResults.substractPriority]
        let results = [LayoutPriority.high + 1, LayoutPriority.high - 1]

        zip(results, expectedResults).forEach { result, expected in
            XCTAssertEqual(result, expected)
        }
    }
}

