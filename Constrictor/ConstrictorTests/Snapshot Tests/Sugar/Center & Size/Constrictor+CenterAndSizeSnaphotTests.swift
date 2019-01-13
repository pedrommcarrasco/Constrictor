//
//  Constrictor+CenterAndSizeSnaphotTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 13/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Constrictor

// MARK: - ConstrictorCenterAndSizeSnapshotTests
final class ConstrictorCenterAndSizeSnapshotTests: XCTestCase {
    
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
extension ConstrictorCenterAndSizeSnapshotTests {
    
    func testScenarioA() {
        view.constrictor
            .center(in: viewController.view)
            .size(to: SnapshotConstants.Size.L)
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func testScenarioB() {
        view.constrictor
            .center(in: viewController.view, with: .x(-SnapshotConstants.Spacing.standard))
            .size(to: viewController.view, with: -SnapshotConstants.Size.L)
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func testScenarioC() {
        view.constrictor
            .center(in: viewController.view)
            .size(to: viewController.view, with: .width(-SnapshotConstants.Size.L))
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func testScenarioD() {
        view.constrictor
            .center(in: viewController.view, with: SnapshotConstants.Spacing.standard)
            .size(to: .width(SnapshotConstants.Size.L) & .height(SnapshotConstants.Size.S))
        
        assertSnapshot(matching: viewController, as: .image)
    }
}
