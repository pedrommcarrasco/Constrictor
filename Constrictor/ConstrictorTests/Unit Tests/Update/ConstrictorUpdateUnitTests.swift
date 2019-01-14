//
//  ConstrictorUpdateUnitTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 14/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

// MARK: - ConstrictorUpdateUnitTests
final class ConstrictorUpdateUnitTests: XCTestCase {

    private enum Constant {
        static let size: CGFloat = 30
        static let greaterSize: CGFloat = 15
        static let lesserSize: CGFloat = 60
        static let xOffset: CGFloat = -10
        static let multiplier: CGFloat = 0.75
        static let timeout: TimeInterval = 2
        static let widthConstraintsCount = 3
    }

    // MARK: Properties
    private var view: UIView!
    private var containerView: UIView!

    // MARK: Lifecycle
    override func setUp() {
        super.setUp()
        containerView = UIView()
        view = UIView()
        containerView.addSubview(view)

        view.constrictor
            .size(to: Constant.size)
            .width(as: .greaterThanOrEqual, to: containerView, with: Constant.greaterSize, multiplyBy: Constant.multiplier)
            .width(as: .lessThanOrEqual, to: containerView, with: Constant.lesserSize)
            .center(in: containerView)
    }

    override func tearDown() {
        containerView = nil
        view = nil
        super.tearDown()
    }
}

// MARK: - Tests
extension ConstrictorUpdateUnitTests {

    // MARK: Soft Finder
    func testSoftFinder() {
        var constraints = [NSLayoutConstraint]()
        view.constrictor.update(.width) { constraints = $0 }

        XCTAssertEqual(constraints.count, Constant.widthConstraintsCount)
    }

    func testSoftFinderFirst() {
        var constraint: NSLayoutConstraint?
        view.constrictor.updateFirst(.width) { constraint = $0 }

        XCTAssertEqual(constraint?.constant, Constant.size)
        XCTAssertEqual(constraint?.relation, .equal)
    }

    // MARK: Deep Finder
    func testDeepFinderUpdateAnchor() {
        var constraint: NSLayoutConstraint?
        view.constrictor.update(.centerX, to: containerView) { constraint = $0 }

        XCTAssertEqual(constraint?.secondItem as? UIView, containerView)
        XCTAssertEqual(constraint?.secondAttribute, .centerX)
    }


    func testDeepFinderUpdateDimensionAnchor() {
        var constraint: NSLayoutConstraint?
        view.constrictor.update(.width, to: containerView) { constraint = $0 }

        XCTAssertEqual(constraint?.constant, Constant.greaterSize )
    }

    func testDeepFinderUpdateDimensionAnchorAsGreater() {
        var constraint: NSLayoutConstraint?
        view.constrictor.update(.width, as: .greaterThanOrEqual, to: containerView) { constraint = $0 }

        XCTAssertEqual(constraint?.relation, .greaterThanOrEqual)
        XCTAssertEqual(constraint?.constant, Constant.greaterSize )
    }
}
