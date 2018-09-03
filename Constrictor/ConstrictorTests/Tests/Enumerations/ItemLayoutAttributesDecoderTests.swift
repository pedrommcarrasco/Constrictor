////
////  ItemLayoutrAttributesDecoderTests.swift
////  ConstrictorTests
////
////  Created by Pedro Carrasco on 28/05/2018.
////  Copyright © 2018 Pedro Carrasco. All rights reserved.
////

import XCTest
@testable import Constrictor

// MARK: - ItemLayoutrAttributesDecoderTests
class ItemLayoutrAttributesDecoderTests: XCTestCase {

    private var view: UIView!
    private var viewController: UIViewController!
    private var layoutGuide: UILayoutGuide!

    // MARK:  Constants
    private enum Constants {
        static let constant: CGFloat = 50.0
    }

    // MARK: Lifecycle
    override func setUp() {
        super.setUp()

        view = UIView()
        viewController = UIViewController()
        layoutGuide = UILayoutGuide()
    }
}

// MARK: - Tests
extension ItemLayoutrAttributesDecoderTests {

    // MARK:  itemLayoutAttribute(for item: Constrictable?) -> (item: Any?, layoutAttribute: NSLayoutAttribute)
    func testItemLayoutAttributeForUIViewNone() {

        test(view, for: .none, expectedAttribute: .notAnAttribute, constant: .all(Constants.constant), expectedConstant: 0.0)
    }

    func testItemLayoutAttributeForUIViewTop() {

        test(view, for: .top, expectedAttribute: .top, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewTopGuide() {

        test(view, for: .topGuide, expectedAttribute: .top, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewBottom() {

        test(view, for: .bottom, expectedAttribute: .bottom, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUIViewBottomGuide() {

        test(view, for: .bottomGuide, expectedAttribute: .bottom, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUIViewRight() {

        test(view, for: .right, expectedAttribute: .right, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUIViewRightGuide() {

        test(view, for: .rightGuide, expectedAttribute: .right, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUIViewLeft() {

        test(view, for: .left, expectedAttribute: .left, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewLeftGuide() {

        test(view, for: .leftGuide, expectedAttribute: .left, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewLeading() {

        test(view, for: .leading, expectedAttribute: .leading, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewLeadingGuide() {

        test(view, for: .leadingGuide, expectedAttribute: .leading, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewTrailing() {

        test(view, for: .trailing, expectedAttribute: .trailing, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUIViewTrailingGuide() {

        test(view, for: .trailingGuide, expectedAttribute: .trailing, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUIViewCenterX() {

        test(view, for: .centerX, expectedAttribute: .centerX, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewCenterXGuide() {

        test(view, for: .centerXGuide, expectedAttribute: .centerX, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewCenterY() {

        test(view, for: .centerY, expectedAttribute: .centerY, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewCenterYGuide() {

        test(view, for: .centerYGuide, expectedAttribute: .centerY, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewWidth() {

        test(view, for: .width, expectedAttribute: .width, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewHeight() {

        test(view, for: .height, expectedAttribute: .height, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideTop() {

        test(layoutGuide, for: .top, expectedAttribute: .top, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideTopGuide() {

        test(layoutGuide, for: .topGuide, expectedAttribute: .top, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideBottom() {

        test(layoutGuide, for: .bottom, expectedAttribute: .bottom, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideBottomGuide() {

        test(layoutGuide, for: .bottomGuide, expectedAttribute: .bottom, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideRight() {

        test(layoutGuide, for: .right, expectedAttribute: .right, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideRightGuide() {

        test(layoutGuide, for: .rightGuide, expectedAttribute: .right, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideLeft() {

        test(layoutGuide, for: .left, expectedAttribute: .left, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideLeftGuide() {

        test(layoutGuide, for: .leftGuide, expectedAttribute: .left, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideLeading() {

        test(layoutGuide, for: .leading, expectedAttribute: .leading, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideLeadingGuide() {

        test(layoutGuide, for: .leadingGuide, expectedAttribute: .leading, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideTrailing() {

        test(layoutGuide, for: .trailing, expectedAttribute: .trailing, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideTrailingGuide() {

        test(layoutGuide, for: .trailingGuide, expectedAttribute: .trailing, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideCenterX() {

        test(layoutGuide, for: .centerX, expectedAttribute: .centerX, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideCenterXGuide() {

        test(layoutGuide, for: .centerXGuide, expectedAttribute: .centerX, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideCenterY() {

        test(layoutGuide, for: .centerY, expectedAttribute: .centerY, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideCenterYGuide() {

        test(layoutGuide, for: .centerYGuide, expectedAttribute: .centerY, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideWidth() {

        test(layoutGuide, for: .width, expectedAttribute: .width, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUILayoutGuideHeight() {

        test(layoutGuide, for: .height, expectedAttribute: .height, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerTop() {

        test(viewController, for: .top, expectedAttribute: .top, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerTopGuide() {

        test(viewController, for: .topGuide, expectedAttribute: .top, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerBottom() {

        test(viewController, for: .bottom, expectedAttribute: .bottom, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerBottomGuide() {

        test(viewController, for: .bottomGuide, expectedAttribute: .bottom, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerRight() {

        test(viewController, for: .right, expectedAttribute: .right, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerRightGuide() {

        test(viewController, for: .rightGuide, expectedAttribute: .right, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerLeft() {

        test(viewController, for: .left, expectedAttribute: .left, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerLeftGuide() {

        test(viewController, for: .leftGuide, expectedAttribute: .left, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerLeading() {

        test(viewController, for: .leading, expectedAttribute: .leading, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerLeadingGuide() {

        test(viewController, for: .leadingGuide, expectedAttribute: .leading, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerTrailing() {

        test(viewController, for: .trailing, expectedAttribute: .trailing, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerTrailingGuide() {

        test(viewController, for: .trailingGuide, expectedAttribute: .trailing, constant: .all(Constants.constant), expectedConstant: -Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerCenterX() {

        test(viewController, for: .centerX, expectedAttribute: .centerX, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerCenterXGuide() {

        test(viewController, for: .centerXGuide, expectedAttribute: .centerX, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerCenterY() {

        test(viewController, for: .centerY, expectedAttribute: .centerY, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerCenterYGuide() {

        test(viewController, for: .centerYGuide, expectedAttribute: .centerY, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerWidth() {

        test(viewController, for: .width, expectedAttribute: .width, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerHeight() {

        test(viewController, for: .height, expectedAttribute: .height, constant: .all(Constants.constant), expectedConstant: Constants.constant)
    }

    func testItemLayoutAttributeForUIViewControllerNone() {

        test(viewController, for: .none, expectedAttribute: .notAnAttribute, constant: .all(Constants.constant), expectedConstant: 0.0)
    }
}

// MARK: - Utils
private extension ItemLayoutrAttributesDecoderTests {

    func test(_ view: UIView,
              for attribute: ConstrictorAttribute,
              expectedAttribute: NSLayoutAttribute,
              constant: Constant = .zero,
              expectedConstant: CGFloat = 0.0) {

        let itemAttributeTuple = ItemLayoutAttributesDecoder.itemLayoutAttribute(for: view, with: attribute, and: constant)
        let resultItem = itemAttributeTuple.item
        let resultAttribute = itemAttributeTuple.layoutAttribute

        if #available(iOS 11.0, *), ConstrictorAttribute.guidedAttributes.contains(attribute) {
            let expectedItem = view.safeAreaLayoutGuide
            XCTAssertEqual(resultItem as? UILayoutGuide, expectedItem)

        } else {
            let expectedItem = view
            XCTAssertEqual(resultItem as? UIView, expectedItem)
        }

        XCTAssertEqual(resultAttribute, expectedAttribute)
        XCTAssertEqual(itemAttributeTuple.constant, expectedConstant)
    }

    func test(_ layoutGuide: UILayoutGuide,
              for attribute: ConstrictorAttribute,
              expectedAttribute: NSLayoutAttribute,
              constant: Constant = .zero,
              expectedConstant: CGFloat = 0.0) {

        let itemAttributeTuple = ItemLayoutAttributesDecoder.itemLayoutAttribute(for: layoutGuide, with: attribute, and: constant)

        let resultItem = itemAttributeTuple.item
        let resultAttribute = itemAttributeTuple.layoutAttribute


        XCTAssertEqual(resultItem as? UILayoutGuide, layoutGuide)
        XCTAssertEqual(resultAttribute, expectedAttribute)
        XCTAssertEqual(itemAttributeTuple.constant, expectedConstant)
    }

    func test(_ viewController: UIViewController,
              for attribute: ConstrictorAttribute,
              expectedAttribute: NSLayoutAttribute,
              constant: Constant = .zero,
              expectedConstant: CGFloat = 0.0) {

        let itemAttributeTuple = ItemLayoutAttributesDecoder.itemLayoutAttribute(for: viewController, with: attribute, and: constant)

        let resultItem = itemAttributeTuple.item
        let resultAttribute = itemAttributeTuple.layoutAttribute

        if #available(iOS 11.0, *), ConstrictorAttribute.guidedAttributes.contains(attribute) {
            let expectedItem = viewController.view.safeAreaLayoutGuide
            XCTAssertEqual(resultItem as? UILayoutGuide, expectedItem)

        } else if attribute == .topGuide {
            let expectedItem = viewController.topLayoutGuide
            guard let resultItem = resultItem as? UILayoutSupport else { return XCTFail() }

            XCTAssertEqual(resultAttribute, .bottom)
            XCTAssert(resultItem.isEqual(expectedItem))

            return

        } else if attribute == .bottomGuide {
            let expectedItem = viewController.bottomLayoutGuide
            guard let resultItem = resultItem as? UILayoutSupport else { return XCTFail() }

            XCTAssertEqual(resultAttribute, .top)
            XCTAssert(resultItem.isEqual(expectedItem))

            return

        } else if attribute == .centerXGuide {
            XCTAssertNotNil(resultItem as? UILayoutGuide)

        } else if attribute == .centerYGuide {
            XCTAssertNotNil(resultItem as? UILayoutGuide)
        }

        XCTAssertEqual(resultAttribute, expectedAttribute)
        XCTAssertEqual(itemAttributeTuple.constant, expectedConstant)
    }
}
