//
//  AnchorXAxisUnitTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 12/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

// MARK: - AnchorXAxisUnitTests
final class AnchorXAxisUnitTests: XCTestCase {

    // MARK: Properties
    private var anchorable: Anchorable!
    
    // MARK: Lifecycle
    override func setUp() {
        super.setUp()
        anchorable = UIView()
    }
    
    override func tearDown() {
        anchorable = nil
        super.tearDown()
    }
}

// MARK: - Tests
extension AnchorXAxisUnitTests {
    
    // MARK: Anchor
    func testAnchor() {
        let anchors = [anchorable.centerXAnchor, anchorable.leftAnchor, anchorable.leadingAnchor,
                       anchorable.rightAnchor, anchorable.trailingAnchor]
        zip(AnchorXAxis.allCases, anchors).forEach { xAxisAnchor, anchor in
            XCTAssertEqual(xAxisAnchor.anchor(for: anchorable), anchor)
        }
    }
}
