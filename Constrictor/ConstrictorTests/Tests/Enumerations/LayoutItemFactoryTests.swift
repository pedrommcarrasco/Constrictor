////
////  LayoutItemFactoryTests.swift
////  ConstrictorTests
////
////  Created by Pedro Carrasco on 28/05/2018.
////  Copyright © 2018 Pedro Carrasco. All rights reserved.
////

import XCTest
@testable import Constrictor

// MARK: - LayoutItemFactoryTests
class LayoutItemFactoryTests: XCTestCase {

    private var parent: UIView!
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

        parent = UIView()

        view = UIView()
        viewController = UIViewController()
        layoutGuide = UILayoutGuide()

        parent.addSubview(view)
        parent.addSubview(viewController.view)
    }
}

// MARK: - Tests
extension LayoutItemFactoryTests {

    // MARK:  itemLayoutAttribute(for item: Constrictable?) -> (item: Any?, layoutAttribute: NSLayoutConstraint.Attribute)
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
    
    func testSafeLayoutGuideFakeArea() {
        testFakeArea(viewController)
    }
}

// MARK: - Utils
private extension LayoutItemFactoryTests {

    func testFakeArea(_ viewController: UIViewController) {
        let item1 = LayoutItemFactory.makeLayoutItem(element: viewController, attribute: .topGuide, constant: .top(20))
        let item2 = LayoutItemFactory.makeLayoutItem(element: viewController, attribute: .topGuide, constant: .top(20))
        
        XCTAssertEqual(item1.attribute, item2.attribute)
    }
    
    func test(_ view: UIView,
              for attribute: ConstrictorAttribute,
              expectedAttribute: NSLayoutConstraint.Attribute,
              constant: Constant = .zero,
              expectedConstant: CGFloat = 0.0) {

        let items = LayoutItemFactory.makeLayoutItems(firstElement: parent,
                                                      secondElement: view,
                                                      firstAttribute: attribute,
                                                      secondAttribute: attribute,
                                                      constant: constant)

        if #available(iOS 11.0, *), ConstrictorAttribute.guidedAttributes.contains(attribute) {

            let expectedItem = view.safeAreaLayoutGuide
            XCTAssertEqual(items.tail.element as? UILayoutGuide, expectedItem)

        } else {

            let expectedItem = view
            XCTAssertEqual(items.tail.element as? UIView, expectedItem)
        }

        XCTAssertEqual(items.head.attribute, expectedAttribute)
        XCTAssertEqual(items.tail.attribute, expectedAttribute)
        XCTAssertEqual(items.head.constant, expectedConstant)
    }

    func test(_ layoutGuide: UILayoutGuide,
              for attribute: ConstrictorAttribute,
              expectedAttribute: NSLayoutConstraint.Attribute,
              constant: Constant = .zero,
              expectedConstant: CGFloat = 0.0) {

        let item = LayoutItemFactory.makeLayoutItem(element: layoutGuide,
                                                    attribute: attribute,
                                                    constant: constant)

        XCTAssertEqual(item.attribute, expectedAttribute)
        XCTAssertEqual(item.constant, expectedConstant)
    }

    func test(_ viewController: UIViewController,
              for attribute: ConstrictorAttribute,
              expectedAttribute: NSLayoutConstraint.Attribute,
              constant: Constant = .zero,
              expectedConstant: CGFloat = 0.0) {

        let items = LayoutItemFactory.makeLayoutItems(firstElement: parent,
                                                      secondElement: viewController,
                                                      firstAttribute: attribute,
                                                      secondAttribute: attribute,
                                                      constant: constant)

        if #available(iOS 11.0, *), ConstrictorAttribute.guidedAttributes.contains(attribute) {

            let expectedItem = viewController.view.safeAreaLayoutGuide
            XCTAssertEqual(items.tail.element as? UILayoutGuide, expectedItem)

        } else if attribute == .centerXGuide { XCTAssertNotNil(items.tail.element as? UILayoutGuide)
        } else if attribute == .centerYGuide { XCTAssertNotNil(items.tail.element as? UILayoutGuide)
        } else if attribute == .topGuide {

            let expectedItem = viewController.topLayoutGuide
            guard let resultItem = items.tail.element as? UILayoutSupport else { return XCTFail() }

            XCTAssert(resultItem.isEqual(expectedItem))

            return

        } else if attribute == .bottomGuide {

            let expectedItem = viewController.bottomLayoutGuide
            guard let resultItem = items.tail.element as? UILayoutSupport else { return XCTFail() }

            XCTAssert(resultItem.isEqual(expectedItem))

            return
        }

        XCTAssertEqual(items.head.attribute, expectedAttribute)
        XCTAssertEqual(items.tail.attribute, expectedAttribute)
        XCTAssertEqual(items.head.constant, expectedConstant)
    }
}
