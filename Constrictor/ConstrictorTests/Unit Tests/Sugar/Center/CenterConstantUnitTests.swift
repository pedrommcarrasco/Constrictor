//
//  CenterConstantUnitTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 13/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

// MARK: - CenterConstantUnitTests
final class CenterConstantUnitTests: XCTestCase {
    
    // MARK: Properties
    private enum Constant {
        static let constant: CGFloat = 10
    }
}

// MARK: - Tests
extension CenterConstantUnitTests {
    
    // MARK: Modifiers
    func testModifiers() {
        let results = [CenterConstant.x(Constant.constant), CenterConstant.y(Constant.constant)]
        let expectedResults: [(x: CGFloat, y: CGFloat)] = [(x: Constant.constant, y: 0), (x: 0, y: Constant.constant)]
        
        zip(results, expectedResults).forEach { result, expected in
            XCTAssertEqual(result.x, expected.x)
            XCTAssertEqual(result.y, expected.y)
        }
    }
    
    // MARK: Operators
    func testOperators() {
        let result = CenterConstant.x(Constant.constant) & CenterConstant.y(Constant.constant)
        XCTAssertEqual(result.x, Constant.constant)
        XCTAssertEqual(result.y, Constant.constant)
    }
}
