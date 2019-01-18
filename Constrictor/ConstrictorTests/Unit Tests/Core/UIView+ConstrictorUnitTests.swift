//
//  UIView+ConstrictorUnitTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 13/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Constrictor

// MARK: - UIViewConstrictorUnitTests
final class UIViewConstrictorUnitTests: XCTestCase {

    // MARK: Properties
    private var view: UIView!
    
    // MARK: Lifecycle
    override func setUp() {
        super.setUp()
        view = UIView()
    }
    
    override func tearDown() {
        view = nil
        super.tearDown()
    }
}

// MARK: - Tests
extension UIViewConstrictorUnitTests {
    
    // MARK: constrictor
    func testConstrictor() {
        let constrictor = view.constrictor.width(to: view, .height)
        XCTAssert(constrictor == view.constrictor)
    }
}

