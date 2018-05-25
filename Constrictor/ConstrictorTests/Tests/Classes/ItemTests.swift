//
//  ItemTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 25/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

class ItemTests: XCTestCase {
    
    // MARK: Properties
    var aView: UIView!

    // MARK: Lifecycle
    override func setUp() {
        super.setUp()

        aView = UIView()
    }

    override func tearDown() {

        aView = nil

        super.tearDown()
    }

    // MARK: Test - object(for view: UIView?, withinSafeArea: Bool) -> Any?
    func testObjectWithinSafeArea() {

        guard let result = Item.object(for: aView, withinSafeArea: true) as? UILayoutGuide else { return XCTFail() }

        let expectResult = aView.safeAreaLayoutGuide

        XCTAssertEqual(result, expectResult)
    }

    func testObjectWithinSafeAreaFail() {

        guard let _ = Item.object(for: aView, withinSafeArea: true) as? UIView else { return XCTAssertTrue(true) }
        XCTFail()
    }

    func testObjectWithoutSafeArea() {

        guard let result = Item.object(for: aView, withinSafeArea: false) as? UIView else { return XCTFail() }

        let expectResult = aView

        XCTAssertEqual(result, expectResult)
    }

    func testObjectWithoutView() {

        guard let result = Item.object(for: nil, withinSafeArea: true) as? UIView? else { return XCTFail() }

        let expectResult: UIView? = nil

        XCTAssertEqual(result, expectResult)
    }
}
