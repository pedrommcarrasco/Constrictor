//
//  AnchorYAxisUnitTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 12/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

// MARK: - AnchorYAxisUnitTests
final class AnchorYAxisUnitTests: XCTestCase {
    
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
extension AnchorYAxisUnitTests {
    
    // MARK: Anchor
    func testAnchor() {
        let anchors = [anchorable.centerYAnchor, anchorable.topAnchor, anchorable.bottomAnchor]
        zip(AnchorYAxis.allCases, anchors).forEach { yAxisAnchor, anchor in
            XCTAssertEqual(yAxisAnchor.anchor(for: anchorable), anchor)
        }
    }
}
