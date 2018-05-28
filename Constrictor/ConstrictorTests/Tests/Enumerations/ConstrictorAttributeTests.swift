//
//  ConstrictorAttributeTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 28/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

class ConstrictorAttributeTests: XCTestCase {

    var view: UIView!
    var viewController: UIViewController!
    var layoutGuide: UILayoutGuide!

    // MARK:  Constants
    enum Constants {}

    // MARK: Lifecycle
    override func setUp() {
        super.setUp()

        view = UIView()
        viewController = UIViewController()
        layoutGuide = UILayoutGuide()
    }

    override func tearDown() {

        view = nil
        viewController = nil
        layoutGuide = nil

        super.tearDown()
    }

    // MARK:  Test - itemLayoutAttribute(for item: Constrictable?) -> (item: Any?, layoutAttribute: NSLayoutAttribute)
    func testItemLayoutAttributeForUIViewTop() {

        test(view, for: .top, expectedAttribute: .top)
    }

    func testItemLayoutAttributeForUIViewTopGuide() {

        test(view, for: .topGuide, expectedAttribute: .top)
    }

    func testItemLayoutAttributeForUIViewBottom() {

        test(view, for: .bottom, expectedAttribute: .bottom)
    }

    func testItemLayoutAttributeForUIViewBottomGuide() {

        test(view, for: .bottomGuide, expectedAttribute: .bottom)
    }

    func testItemLayoutAttributeForUIViewRight() {

        test(view, for: .right, expectedAttribute: .right)
    }

    func testItemLayoutAttributeForUIViewRightGuide() {

        test(view, for: .rightGuide, expectedAttribute: .right)
    }

    func testItemLayoutAttributeForUIViewLeft() {

        test(view, for: .left, expectedAttribute: .left)
    }

    func testItemLayoutAttributeForUIViewLeftGuide() {

        test(view, for: .leftGuide, expectedAttribute: .left)
    }

    func testItemLayoutAttributeForUIViewLeading() {

        test(view, for: .leading, expectedAttribute: .leading)
    }

    func testItemLayoutAttributeForUIViewLeadingGuide() {

        test(view, for: .leadingGuide, expectedAttribute: .leading)
    }

    func testItemLayoutAttributeForUIViewTrailing() {

        test(view, for: .trailing, expectedAttribute: .trailing)
    }

    func testItemLayoutAttributeForUIViewTrailingGuide() {

        test(view, for: .trailingGuide, expectedAttribute: .trailing)
    }

    func testItemLayoutAttributeForUIViewCenterX() {

        test(view, for: .centerX, expectedAttribute: .centerX)
    }

    func testItemLayoutAttributeForUIViewCenterXGuide() {

        test(view, for: .centerXGuide, expectedAttribute: .centerX)
    }

    func testItemLayoutAttributeForUIViewCenterY() {

        test(view, for: .centerY, expectedAttribute: .centerY)
    }

    func testItemLayoutAttributeForUIViewCenterYGuide() {

        test(view, for: .centerYGuide, expectedAttribute: .centerY)
    }

    func testItemLayoutAttributeForUIViewWidth() {

       test(view, for: .width, expectedAttribute: .width)
    }

    func testItemLayoutAttributeForUIViewHeight() {

        test(view, for: .height, expectedAttribute: .height)
    }

    func testItemLayoutAttributeForUILayoutGuideTop() {

        test(layoutGuide, for: .top, expectedAttribute: .top)
    }

    func testItemLayoutAttributeForUILayoutGuideTopGuide() {

        test(layoutGuide, for: .topGuide, expectedAttribute: .top)
    }

    func testItemLayoutAttributeForUILayoutGuideBottom() {

        test(layoutGuide, for: .bottom, expectedAttribute: .bottom)
    }

    func testItemLayoutAttributeForUILayoutGuideBottomGuide() {

        test(layoutGuide, for: .bottomGuide, expectedAttribute: .bottom)
    }

    func testItemLayoutAttributeForUILayoutGuideRight() {

        test(layoutGuide, for: .right, expectedAttribute: .right)
    }

    func testItemLayoutAttributeForUILayoutGuideRightGuide() {

        test(layoutGuide, for: .rightGuide, expectedAttribute: .right)
    }

    func testItemLayoutAttributeForUILayoutGuideLeft() {

        test(layoutGuide, for: .left, expectedAttribute: .left)
    }

    func testItemLayoutAttributeForUILayoutGuideLeftGuide() {

        test(layoutGuide, for: .leftGuide, expectedAttribute: .left)
    }

    func testItemLayoutAttributeForUILayoutGuideLeading() {

        test(layoutGuide, for: .leading, expectedAttribute: .leading)
    }

    func testItemLayoutAttributeForUILayoutGuideLeadingGuide() {

        test(layoutGuide, for: .leadingGuide, expectedAttribute: .leading)
    }

    func testItemLayoutAttributeForUILayoutGuideTrailing() {

        test(layoutGuide, for: .trailing, expectedAttribute: .trailing)
    }

    func testItemLayoutAttributeForUILayoutGuideTrailingGuide() {

        test(layoutGuide, for: .trailingGuide, expectedAttribute: .trailing)
    }

    func testItemLayoutAttributeForUILayoutGuideCenterX() {

        test(layoutGuide, for: .centerX, expectedAttribute: .centerX)
    }

    func testItemLayoutAttributeForUILayoutGuideCenterXGuide() {

        test(layoutGuide, for: .centerXGuide, expectedAttribute: .centerX)
    }

    func testItemLayoutAttributeForUILayoutGuideCenterY() {

        test(layoutGuide, for: .centerY, expectedAttribute: .centerY)
    }

    func testItemLayoutAttributeForUILayoutGuideCenterYGuide() {

        test(layoutGuide, for: .centerYGuide, expectedAttribute: .centerY)
    }

    func testItemLayoutAttributeForUILayoutGuideWidth() {

        test(layoutGuide, for: .width, expectedAttribute: .width)
    }

    func testItemLayoutAttributeForUILayoutGuideHeight() {

        test(layoutGuide, for: .height, expectedAttribute: .height)
    }

    func testItemLayoutAttributeForUIViewControllerTop() {

        test(viewController, for: .top, expectedAttribute: .top)
    }

    func testItemLayoutAttributeForUIViewControllerTopGuide() {

        test(viewController, for: .topGuide, expectedAttribute: .top)
    }

    func testItemLayoutAttributeForUIViewControllerBottom() {

        test(viewController, for: .bottom, expectedAttribute: .bottom)
    }

    func testItemLayoutAttributeForUIViewControllerBottomGuide() {

        test(viewController, for: .bottomGuide, expectedAttribute: .bottom)
    }

    func testItemLayoutAttributeForUIViewControllerRight() {

        test(viewController, for: .right, expectedAttribute: .right)
    }

    func testItemLayoutAttributeForUIViewControllerRightGuide() {

        test(viewController, for: .rightGuide, expectedAttribute: .right)
    }

    func testItemLayoutAttributeForUIViewControllerLeft() {

        test(viewController, for: .left, expectedAttribute: .left)
    }

    func testItemLayoutAttributeForUIViewControllerLeftGuide() {

        test(viewController, for: .leftGuide, expectedAttribute: .left)
    }

    func testItemLayoutAttributeForUIViewControllerLeading() {

        test(viewController, for: .leading, expectedAttribute: .leading)
    }

    func testItemLayoutAttributeForUIViewControllerLeadingGuide() {

        test(viewController, for: .leadingGuide, expectedAttribute: .leading)
    }

    func testItemLayoutAttributeForUIViewControllerTrailing() {

        test(viewController, for: .trailing, expectedAttribute: .trailing)
    }

    func testItemLayoutAttributeForUIViewControllerTrailingGuide() {

        test(viewController, for: .trailingGuide, expectedAttribute: .trailing)
    }

    func testItemLayoutAttributeForUIViewControllerCenterX() {

        test(viewController, for: .centerX, expectedAttribute: .centerX)
    }

    func testItemLayoutAttributeForUIViewControllerCenterXGuide() {

        test(viewController, for: .centerXGuide, expectedAttribute: .centerX)
    }

    func testItemLayoutAttributeForUIViewControllerCenterY() {

        test(viewController, for: .centerY, expectedAttribute: .centerY)
    }

    func testItemLayoutAttributeForUIViewControllerCenterYGuide() {

        test(viewController, for: .centerYGuide, expectedAttribute: .centerY)
    }

    func testItemLayoutAttributeForUIViewControllerWidth() {

        test(viewController, for: .width, expectedAttribute: .width)
    }

    func testItemLayoutAttributeForUIViewControllerHeight() {

        test(viewController, for: .height, expectedAttribute: .height)
    }
}

private extension ConstrictorAttributeTests {

    func test(_ view: UIView, for attribute: ConstrictorAttribute, expectedAttribute: NSLayoutAttribute) {

        let itemAttributeTuple = attribute.itemLayoutAttribute(for: view)

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
    }

    func test(_ layoutGuide: UILayoutGuide, for attribute: ConstrictorAttribute, expectedAttribute: NSLayoutAttribute) {

        let itemAttributeTuple = attribute.itemLayoutAttribute(for: layoutGuide)

        let resultItem = itemAttributeTuple.item
        let resultAttribute = itemAttributeTuple.layoutAttribute


        XCTAssertEqual(resultItem as? UILayoutGuide, layoutGuide)
        XCTAssertEqual(resultAttribute, expectedAttribute)
    }

    func test(_ viewController: UIViewController, for attribute: ConstrictorAttribute, expectedAttribute: NSLayoutAttribute) {

        let itemAttributeTuple = attribute.itemLayoutAttribute(for: viewController)

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
    }
}
