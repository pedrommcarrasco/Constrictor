//
//  AnchorDimensionUnitTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 12/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

// MARK: - AnchorDimensionUnitTests
final class AnchorDimensionUnitTests: XCTestCase {
    
    // MARK: Constant
    private enum Constant {
        static let attributes: [NSLayoutConstraint.Attribute] = [.width, .height]
        enum ExpectedResult {
            static let constraints = 1
        }
    }
    
    // MARK: Properties
    private var constraints: Constraints!
    private var anchorable: UIView!
    
    // MARK: Lifecycle
    override func setUp() {
        super.setUp()
        constraints = Constraints()
        anchorable = UIView()
    }
    
    override func tearDown() {
        constraints = nil
        anchorable = nil
        super.tearDown()
    }
}

// MARK: - Tests
extension AnchorDimensionUnitTests {
    
    // MARK: Attribute
    func testAttributes() {
        zip(AnchorDimension.allCases, Constant.attributes).forEach { dimensionAnchor, expected in
            XCTAssertEqual(dimensionAnchor.attribute, expected)
        }
    }
    
    // MARK: Constraints
    func testConstraints() {
        AnchorDimension.allCases.forEach {
            self.arrangeConstraints(for: $0)
            XCTAssertEqual($0.constraints(for: self.constraints).count, Constant.ExpectedResult.constraints)
        }
    }
    
    // MARK: Anchor
    func testAnchor() {
        let anchors = [anchorable.widthAnchor, anchorable.heightAnchor]
        zip(AnchorDimension.allCases, anchors).forEach { dimensionAnchor, anchor in
            XCTAssertEqual(dimensionAnchor.anchor(for: anchorable), anchor)
        }
    }
}

// MARK: - Helper
private extension AnchorDimensionUnitTests {
    
    func arrangeConstraints(for anchor: AnchorDimension) {
        switch anchor {
        case .width: constraints.width.append(NSLayoutConstraint())
        case .height: constraints.height.append(NSLayoutConstraint())
        }
    }
}
