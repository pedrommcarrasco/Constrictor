//
//  UILayoutPriority+OperatorsTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 08/07/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

class OperatorsTests: XCTestCase {
    
    // MARK: ExpectedResults
    enum ExpectedResults {
        
        static let addPriority = UILayoutPriority(751.0)
        static let substractPriority = UILayoutPriority(749.0)
    }
    
    // MARK: Test - +(lhs: UILayoutPriority, rhs: Float) -> UILayoutPriority
    func testAddPriority() {
        let result = UILayoutPriority.defaultHigh + 1
        
        XCTAssertEqual(result, ExpectedResults.addPriority)
    }
    
    // MARK: Test - -(lhs: UILayoutPriority, rhs: Float) -> UILayoutPriority
    func testSubstractPriority() {
        
        let result = UILayoutPriority.defaultHigh - 1
        
        XCTAssertEqual(result, ExpectedResults.substractPriority)
    }
}


