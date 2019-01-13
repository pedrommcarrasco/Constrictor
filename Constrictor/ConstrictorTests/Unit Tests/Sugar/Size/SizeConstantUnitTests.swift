//
//  SizeConstantUnitTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 13/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

// MARK: - SizeConstantUnitTests
final class SizeConstantUnitTests: XCTestCase {
    
    // MARK: Properties
    private enum Constant {
        static let constant: CGFloat = 10
    }
}

// MARK: - Tests
extension SizeConstantUnitTests {
    
    // MARK: Init
    func testInit() {
        let result = SizeConstant(size: Constant.constant)
        XCTAssertEqual(result.width, Constant.constant)
        XCTAssertEqual(result.width, Constant.constant)
    }
    
    // MARK: Modifiers
    func testModifiers() {
        let results = [SizeConstant.width(Constant.constant), SizeConstant.height(Constant.constant)]
        let expectedResults = [(width: Constant.constant, height: 0), (width: 0, height: Constant.constant)]
        
        zip(results, expectedResults).forEach { result, expected in
            XCTAssertEqual(result.width, expected.width)
            XCTAssertEqual(result.height, expected.height)
        }
    }
    
    // MARK: Operators
    func testOperators() {
        let result = SizeConstant.width(Constant.constant) & SizeConstant.height(Constant.constant)
        XCTAssertEqual(result.width, Constant.constant)
        XCTAssertEqual(result.height, Constant.constant)
    }
}
