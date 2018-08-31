////
////  ConstantTests.swift
////  ConstrictorTests
////
////  Created by Pedro Carrasco on 23/05/2018.
////  Copyright © 2018 Pedro Carrasco. All rights reserved.
////
//
//import XCTest
//@testable import Constrictor
//
//class ConstantTests: XCTestCase {
//
//    // MARK:  Constants
//    enum Constants {
//        static let value: CGFloat = 10.0
//
//        static let normalizedValue: CGFloat = 10.0
//        static let invertedNormalizedValue: CGFloat = -10.0
//    }
//
//    // MARK:  Test - normalizeConstant(for attribute: NSLayoutAttribute, value: CGFloat) -> CGFloat
//    func testNormalizeConstantForLeading() {
//
//        testNormalizeConstant(for: .leading, value: Constants.value, expectedResult: Constants.normalizedValue)
//    }
//
//    func testNormalizeConstantForTrailing() {
//
//        testNormalizeConstant(for: .trailing, value: Constants.value, expectedResult: Constants.invertedNormalizedValue)
//    }
//
//    func testNormalizeConstantForTop() {
//
//        testNormalizeConstant(for: .top, value: Constants.value, expectedResult: Constants.normalizedValue)
//    }
//
//    func testNormalizeConstantForBottom() {
//
//        testNormalizeConstant(for: .bottom, value: Constants.value, expectedResult: Constants.invertedNormalizedValue)
//    }
//
//    func testNormalizeConstantForLeft() {
//
//        testNormalizeConstant(for: .left, value: Constants.value, expectedResult: Constants.normalizedValue)
//    }
//
//    func testNormalizeConstantForRight() {
//
//        testNormalizeConstant(for: .right, value: Constants.value, expectedResult: Constants.invertedNormalizedValue)
//    }
//
//    func testNormalizeConstantForLeadingMargin() {
//
//        testNormalizeConstant(for: .leadingMargin, value: Constants.value, expectedResult: Constants.normalizedValue)
//    }
//
//    func testNormalizeConstantForTrailingMargin() {
//
//        testNormalizeConstant(for: .trailingMargin, value: Constants.value, expectedResult: Constants.invertedNormalizedValue)
//    }
//
//    func testNormalizeConstantForTopMargin() {
//
//        testNormalizeConstant(for: .topMargin, value: Constants.value, expectedResult: Constants.normalizedValue)
//    }
//
//    func testNormalizeConstantForBottomMargin() {
//
//        testNormalizeConstant(for: .bottomMargin, value: Constants.value, expectedResult: Constants.invertedNormalizedValue)
//    }
//
//    func testNormalizeConstantForLeftMargin() {
//
//        testNormalizeConstant(for: .leftMargin, value: Constants.value, expectedResult: Constants.normalizedValue)
//    }
//
//    func testNormalizeConstantForRightMargin() {
//
//        testNormalizeConstant(for: .rightMargin, value: Constants.value, expectedResult: Constants.invertedNormalizedValue)
//    }
//
//    func testNormalizeConstantForCenterY() {
//
//        testNormalizeConstant(for: .centerY, value: Constants.value, expectedResult: Constants.normalizedValue)
//    }
//
//    func testNormalizeConstantForCenterX() {
//
//        testNormalizeConstant(for: .centerX, value: Constants.value, expectedResult: Constants.normalizedValue)
//    }
//
//    func testNormalizeConstantForCenterXWithinMargins() {
//
//        testNormalizeConstant(for: .centerXWithinMargins, value: Constants.value, expectedResult: Constants.normalizedValue)
//    }
//
//    func testNormalizeConstantForCenterYWithinMargins() {
//
//        testNormalizeConstant(for: .centerYWithinMargins, value: Constants.value, expectedResult: Constants.normalizedValue)
//    }
//
//    func testNormalizeConstantForHeight() {
//
//        testNormalizeConstant(for: .height, value: Constants.value, expectedResult: Constants.normalizedValue)
//    }
//
//    func testNormalizeConstantForWidth() {
//
//        testNormalizeConstant(for: .width, value: Constants.value, expectedResult: Constants.normalizedValue)
//    }
//
//    func testNormalizeConstantForFirstBaseline() {
//
//        testNormalizeConstant(for: .firstBaseline, value: Constants.value, expectedResult: Constants.invertedNormalizedValue)
//    }
//
//    func testNormalizeConstantForLastBaseline() {
//
//        testNormalizeConstant(for: .lastBaseline, value: Constants.value, expectedResult: Constants.invertedNormalizedValue)
//    }
//
//    func testNormalizeConstantForNotAnAttribute() {
//
//        testNormalizeConstant(for: .notAnAttribute, value: Constants.value, expectedResult: Constants.normalizedValue)
//    }
//}
//
//private extension ConstantTests {
//
//    func testNormalizeConstant(for attribute: NSLayoutAttribute, value: CGFloat, expectedResult: CGFloat) {
//
//        let result = Constant.normalizeConstant(for: attribute, value: value)
//
//        XCTAssertEqual(result, expectedResult)
//    }
//}
