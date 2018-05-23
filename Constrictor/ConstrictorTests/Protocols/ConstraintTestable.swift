//
//  ConstraintTestable.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 23/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest

protocol ConstraintTestable {}

extension ConstraintTestable where Self: XCTestCase {

    func testConstraint(_ constraint: NSLayoutConstraint,
                        constant: CGFloat = 0.0,
                        multiplier: CGFloat = 1.0,
                        relation: NSLayoutRelation = .equal,
                        isActive: Bool = true) {

        XCTAssertEqual(constraint.constant, constant)
        XCTAssertEqual(constraint.isActive, isActive)
        XCTAssertEqual(constraint.multiplier, multiplier)
        XCTAssertEqual(constraint.relation, relation)
    }
}
