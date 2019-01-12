//
//  AnchorUnitTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 12/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

// MARK: - AnchorUnitTests
final class AnchorUnitTests: XCTestCase {
    
    // MARK: Constant
    private enum Constant {
        static let attributes: [NSLayoutConstraint.Attribute] = [.top, .bottom, .leading, .trailing,
                                                                 .right, .left, .centerX, .centerY, .width, .height]
        enum ExpectedResult {
            static let constraints = 1
        }
    }
    
    // MARK: Properties
    private var constraints: Constraints!
    
    // MARK: Lifecycle
    override func setUp() {
        super.setUp()
        constraints = Constraints()
    }
    
    override func tearDown() {
        constraints = nil
        super.tearDown()
    }
}

// MARK: - Tests
extension AnchorUnitTests {
    
    // MARK: Attribute
    func testAttributes() {
        zip(Anchor.allCases, Constant.attributes).forEach { anchor, expected in
            XCTAssertEqual(anchor.attribute, expected)
        }
    }
    
    // MARK: Constraints
    func testConstraints() {
        Anchor.allCases.forEach {
            self.arrangeConstraints(for: $0)
            XCTAssertEqual($0.constraints(for: self.constraints).count, Constant.ExpectedResult.constraints)
        }
    }
}

// MARK: - Helper
private extension AnchorUnitTests {
    
    func arrangeConstraints(for anchor: Anchor) {
        switch anchor {
        case .top: constraints.top.append(NSLayoutConstraint())
        case .bottom: constraints.bottom.append(NSLayoutConstraint())
        case .leading: constraints.leading.append(NSLayoutConstraint())
        case .trailing: constraints.trailing.append(NSLayoutConstraint())
        case .right: constraints.right.append(NSLayoutConstraint())
        case .left: constraints.left.append(NSLayoutConstraint())
        case .centerX: constraints.centerX.append(NSLayoutConstraint())
        case .centerY: constraints.centerY.append(NSLayoutConstraint())
        case .width: constraints.width.append(NSLayoutConstraint())
        case .height: constraints.height.append(NSLayoutConstraint())
        }
    }
}
