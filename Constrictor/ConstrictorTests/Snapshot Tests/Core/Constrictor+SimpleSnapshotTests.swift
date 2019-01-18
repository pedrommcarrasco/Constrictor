//
//  Constrictor+SimpleSnapshotTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 13/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Constrictor

// MARK: - ConstrictorSimpleSnapshotTests
final class ConstrictorSimpleSnapshotTests: XCTestCase {
    
    // MARK: Properties
    private var viewController: UIViewController!
    private var view: UIView!
    
    // MARK: Lifecycle
    override func setUp() {
        super.setUp()
        view = SnapshotFactory.view()
        viewController = SnapshotFactory.viewController(with: view)
    }
    
    override func tearDown() {
        viewController = nil
        view = nil
        super.tearDown()
    }
    
}

// MARK: - Tests
extension ConstrictorSimpleSnapshotTests {
    
    func testScenarioA() {
        view.constrictor
            .left(to: viewController.view, with: SnapshotConstants.Spacing.standard)
            .right(to: viewController.view, with: -SnapshotConstants.Spacing.standard)
            .top(to: viewController.view)
            .bottom(to: viewController.view)
        
        assertSnapshot(matching: viewController, as: .image)
    }
}

