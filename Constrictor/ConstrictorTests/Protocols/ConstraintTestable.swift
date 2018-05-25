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
                        priority: UILayoutPriority = .required,
                        isActive: Bool = true) {

        XCTAssertEqual(constraint.constant, constant)
        XCTAssertEqual(constraint.isActive, isActive)
        XCTAssertEqual(constraint.multiplier, multiplier)
        XCTAssertEqual(constraint.priority, priority)
        XCTAssertEqual(constraint.relation, relation)
    }

    func expectedConstraintCount(based number: Int, relatedToSafeArea: Bool = true,
                                 numberOfGuides: Int = 0, isInContainer: Bool = false) -> Int {

        let guidesConstraints = 4

        if isInContainer, relatedToSafeArea, numberOfGuides > 0 {
             return number + guidesConstraints + (numberOfGuides * 2)

        } else if isInContainer {
            return number + guidesConstraints

        } else if numberOfGuides > 0 {
            return number * (numberOfGuides * 2)

        } else {
            return number
        }
    }
}
