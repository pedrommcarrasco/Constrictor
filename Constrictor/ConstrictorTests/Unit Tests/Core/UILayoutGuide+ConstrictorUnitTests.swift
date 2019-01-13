//
//  UILayoutGuide+ConstrictorUnitTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 13/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

// MARK: - UILayoutGuideConstrictorUnitTests
final class UILayoutGuideConstrictorUnitTests: XCTestCase {
    
    // MARK: Properties
    private var layoutGuide: UILayoutGuide!
    
    // MARK: Lifecycle
    override func setUp() {
        super.setUp()
        layoutGuide = UILayoutGuide()
    }
    
    override func tearDown() {
        layoutGuide = nil
        super.tearDown()
    }
}

// MARK: - Tests
extension UILayoutGuideConstrictorUnitTests {
    
    // MARK: constrictor
    func testConstrictor() {
        let constrictor = layoutGuide.constrictor.width(to: layoutGuide, .height)
        XCTAssert(constrictor == layoutGuide.constrictor)
    }
}


