//
//  EdgeConstantUnitTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 13/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

// MARK: - EdgeConstantUnitTests
final class EdgeConstantUnitTests: XCTestCase {
    
    // MARK: Constant
    private enum Constant {
        static let constant: CGFloat = 10
    }
}

// MARK: - Tests
extension EdgeConstantUnitTests {
    
    // MARK: Modifiers
    func testModifiers() {
        let value =  Constant.constant
        let results = [EdgeConstant.top(value), EdgeConstant.bottom(value),
                       EdgeConstant.leading(value), EdgeConstant.trailing(value),
                       EdgeConstant.vertical(value), EdgeConstant.horizontal(value),
                       EdgeConstant.zero, EdgeConstant.all(value)]
        let expectedResults = [(top: value, bottom: 0, trailing: 0, leading: 0),
                               (top: 0, bottom: -value, trailing: 0, leading: 0),
                               (top: 0, bottom: 0, trailing: 0, leading: value),
                               (top: 0, bottom: 0, trailing: -value, leading: 0),
                               (top: value, bottom: -value, trailing: 0, leading: 0),
                               (top: 0, bottom: 0, trailing: -value, leading: value),
                               (top: 0, bottom: 0, trailing: 0, leading: 0),
                               (top: value, bottom: -value, trailing: -value, leading: value)]
        
        zip(results, expectedResults).forEach { result, expected in
            XCTAssertEqual(result.top, expected.top)
            XCTAssertEqual(result.bottom, expected.bottom)
            XCTAssertEqual(result.leading, expected.leading)
            XCTAssertEqual(result.trailing, expected.trailing)
        }
    }
    
    // MARK: Operators
    func testOperators() {
        let result = EdgeConstant.leading(Constant.constant) & EdgeConstant.top(Constant.constant)
        XCTAssertEqual(result.top, Constant.constant)
        XCTAssertEqual(result.leading, Constant.constant)
        XCTAssertEqual(result.bottom, 0)
        XCTAssertEqual(result.trailing, 0)
    }
}
