//
//  ConstantTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 01/09/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

// MARK: - ConstantTests
class ConstantTests: XCTestCase {

    // MARK: Constants
    private enum Constants {
        static let value: CGFloat = 50.0
    }

    // MARK: ExpectedResult
    private enum ExpectedResult {
        static let x = Constant(x: Constants.value, y: 0.0, top: 0.0, bottom: 0.0, right: 0.0, left: 0.0, leading: 0.0, trailing: 0.0, width: 0.0, height: 0.0)
        static let y = Constant(x: 0.0, y: Constants.value, top: 0.0, bottom: 0.0, right: 0.0, left: 0.0, leading: 0.0, trailing: 0.0, width: 0.0, height: 0.0)
        static let horizontal = Constant(x: 0.0, y: 0.0, top: 0.0, bottom: 0.0, right: Constants.value, left: Constants.value, leading: Constants.value, trailing: Constants.value, width: 0.0, height: 0.0)
        static let vertical = Constant(x: 0.0, y: 0.0, top: Constants.value, bottom: Constants.value, right: 0.0, left: 0.0, leading: 0.0, trailing: 0.0, width: 0.0, height: 0.0)
        static let top = Constant(x: 0.0, y: 0.0, top: Constants.value, bottom: 0.0, right: 0.0, left: 0.0, leading: 0.0, trailing: 0.0, width: 0.0, height: 0.0)
        static let bottom = Constant(x: 0.0, y: 0.0, top: 0.0, bottom: Constants.value, right: 0.0, left: 0.0, leading: 0.0, trailing: 0.0, width: 0.0, height: 0.0)
        static let right = Constant(x: 0.0, y: 0.0, top: 0.0, bottom: 0.0, right: Constants.value, left: 0.0,leading: 0.0, trailing: 0.0,width: 0.0, height: 0.0)
        static let left = Constant(x: 0.0, y: 0.0, top: 0.0, bottom: 0.0, right: 0.0, left: Constants.value, leading: 0.0, trailing: 0.0, width: 0.0, height: 0.0)
        static let leading = Constant(x: 0.0, y: 0.0, top: 0.0, bottom: 0.0, right: 0.0, left: 0.0, leading: Constants.value, trailing: 0.0, width: 0.0, height: 0.0)
        static let trailing = Constant(x: 0.0, y: 0.0, top: 0.0, bottom: 0.0, right: 0.0, left: 0.0, leading: 0.0, trailing: Constants.value, width: 0.0, height: 0.0)
        static let width = Constant(x: 0.0, y: 0.0, top: 0.0, bottom: 0.0, right: 0.0, left: 0.0, leading: 0.0, trailing: 0.0, width: Constants.value, height: 0.0)
        static let height = Constant(x: 0.0, y: 0.0, top: 0.0, bottom: 0.0, right: 0.0, left: 0.0, leading: 0.0, trailing: 0.0, width: 0.0, height: Constants.value)
        static let zero = Constant(x: 0.0, y: 0.0, top: 0.0, bottom: 0.0, right: 0.0, left: 0.0, leading: 0.0, trailing: 0.0, width: 0.0, height: 0.0)
        static let all = Constant(x: Constants.value, y: Constants.value, top: Constants.value, bottom: Constants.value,
                                  right: Constants.value, left: Constants.value, leading: Constants.value, trailing: Constants.value,
                                  width: Constants.value, height: Constants.value)
    }
}

// MARK: - Tests
extension ConstantTests {

    // MARK: init(attribute: ConstrictorAttribute, value: CGFloat)
    func testInitTop() {

        let expectedResult = ExpectedResult.top
        let result = Constant(attribute: .top, value: Constants.value)
        let resultGuided = Constant(attribute: .topGuide, value: Constants.value)

        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(resultGuided, expectedResult)
    }

    func testInitBottom() {

        let expectedResult = ExpectedResult.bottom
        let result = Constant(attribute: .bottom, value: Constants.value)
        let resultGuided = Constant(attribute: .bottomGuide, value: Constants.value)

        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(resultGuided, expectedResult)
    }

    func testInitLeading() {

        let expectedResult = ExpectedResult.leading
        let result = Constant(attribute: .leading, value: Constants.value)
        let resultGuided = Constant(attribute: .leadingGuide, value: Constants.value)

        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(resultGuided, expectedResult)
    }

    func testInitTrailing() {

        let expectedResult = ExpectedResult.trailing
        let result = Constant(attribute: .trailing, value: Constants.value)
        let resultGuided = Constant(attribute: .trailingGuide, value: Constants.value)

        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(resultGuided, expectedResult)
    }

    func testInitRight() {

        let expectedResult = ExpectedResult.right
        let result = Constant(attribute: .right, value: Constants.value)
        let resultGuided = Constant(attribute: .rightGuide, value: Constants.value)

        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(resultGuided, expectedResult)
    }

    func testInitLeft() {

        let expectedResult = ExpectedResult.left
        let result = Constant(attribute: .left, value: Constants.value)
        let resultGuided = Constant(attribute: .leftGuide, value: Constants.value)

        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(resultGuided, expectedResult)
    }

    func testInitCenterX() {

        let expectedResult = ExpectedResult.x
        let result = Constant(attribute: .centerX, value: Constants.value)
        let resultGuided = Constant(attribute: .centerXGuide, value: Constants.value)

        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(resultGuided, expectedResult)
    }

    func testInitCenterY() {

        let expectedResult = ExpectedResult.y
        let result = Constant(attribute: .centerY, value: Constants.value)
        let resultGuided = Constant(attribute: .centerYGuide, value: Constants.value)

        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(resultGuided, expectedResult)
    }

    func testInitWidth() {

        let expectedResult = ExpectedResult.width
        let result = Constant(attribute: .width, value: Constants.value)

        XCTAssertEqual(result, expectedResult)
    }

    func testInitHeight() {

        let expectedResult = ExpectedResult.height
        let result = Constant(attribute: .height, value: Constants.value)

        XCTAssertEqual(result, expectedResult)
    }

    // MARK:  init(size: CGFloat)
    func testInitSize() {

        let expectedResult = ExpectedResult.height & ExpectedResult.width
        let result = Constant(size: Constants.value)

        XCTAssertEqual(result, expectedResult)
    }

    func testNone() {

        let expectedResult = ExpectedResult.zero
        let result = Constant(attribute: .none, value: Constants.value)

        XCTAssertEqual(result, expectedResult)
    }

    // MARK: x(_ value: CGFloat) -> Constant
    func testX() {

        let expectedResult = ExpectedResult.x
        let result = Constant.x(Constants.value)

        XCTAssertEqual(result, expectedResult)
    }

    // MARK: y(_ value: CGFloat) -> Constant
    func testY() {

        let expectedResult = ExpectedResult.y
        let result = Constant.y(Constants.value)

        XCTAssertEqual(result, expectedResult)
    }
    
    // MARK: horizontal(_ value: CGFloat) -> Constant
    func testHorizontal() {
        
        let expectedResult = ExpectedResult.horizontal
        let result = Constant.horizontal(Constants.value)
        
        XCTAssertEqual(result, expectedResult)
    }
    
    // MARK: vertical(_ value: CGFloat) -> Constant
    func testVertical() {
        
        let expectedResult = ExpectedResult.vertical
        let result = Constant.vertical(Constants.value)
        
        XCTAssertEqual(result, expectedResult)
    }

    // MARK: top(_ value: CGFloat) -> Constant
    func testTop() {

        let expectedResult = ExpectedResult.top
        let result = Constant.top(Constants.value)

        XCTAssertEqual(result, expectedResult)
    }

    // MARK: bottom(_ value: CGFloat) -> Constant
    func testBottom() {

        let expectedResult = ExpectedResult.bottom
        let result = Constant.bottom(Constants.value)

        XCTAssertEqual(result, expectedResult)
    }

    // MARK: right(_ value: CGFloat) -> Constant
    func testRight() {

        let expectedResult = ExpectedResult.right
        let result = Constant.right(Constants.value)

        XCTAssertEqual(result, expectedResult)
    }

    // MARK: left(_ value: CGFloat) -> Constant
    func testLeft() {

        let expectedResult = ExpectedResult.left
        let result = Constant.left(Constants.value)

        XCTAssertEqual(result, expectedResult)
    }

    // MARK: leading(_ value: CGFloat) -> Constant
    func testLeading() {

        let expectedResult = ExpectedResult.leading
        let result = Constant.leading(Constants.value)

        XCTAssertEqual(result, expectedResult)
    }

    // MARK: trailing(_ value: CGFloat) -> Constant
    func testTrailing() {

        let expectedResult = ExpectedResult.trailing
        let result = Constant.trailing(Constants.value)

        XCTAssertEqual(result, expectedResult)
    }

    // MARK: width(_ value: CGFloat) -> Constant
    func testWidth() {

        let expectedResult = ExpectedResult.width
        let result = Constant.width(Constants.value)

        XCTAssertEqual(result, expectedResult)
    }

    // MARK: height(_ value: CGFloat) -> Constant
    func testHeight() {

        let expectedResult = ExpectedResult.height
        let result = Constant.height(Constants.value)

        XCTAssertEqual(result, expectedResult)
    }

    // MARK: all(_ value: CGFloat) -> Constant
    func testAll() {

        let expectedResult = ExpectedResult.all
        let result = Constant.all(Constants.value)

        XCTAssertEqual(result, expectedResult)
    }

    // MARK: .zero: Constant
    func testZero() {

        let expectedResult = ExpectedResult.zero
        let result = Constant.zero

        XCTAssertEqual(result, expectedResult)
    }

    // MARK: & (lhs: Constant, rhs: Constant) -> Constant
    func testAnd() {

        let expectedResult = Constant(x: Constants.value, y: 0.0, top: Constants.value, bottom: Constants.value,
                                      right: 0.0, left: Constants.value, leading: 0.0, trailing: Constants.value,
                                      width: 0.0, height: Constants.value)
        let result: Constant = .x(Constants.value) & .top(Constants.value) & .bottom(Constants.value)
            & .left(Constants.value) & .trailing(Constants.value) & .height(Constants.value)

        XCTAssertEqual(result, expectedResult)
    }
}
