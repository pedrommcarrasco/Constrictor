//
//  Constrictor+EdgeSnapshotTests.swift
//  ConstrictorTests
//
//  Created by Pedro Carrasco on 13/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Constrictor

// MARK: - EdgeConstantUnitTests
final class ConstrictorEdgeSnapshotTests: XCTestCase {
    
    // MARK: Constant
    private enum Constant {
        static let spacing: CGFloat = 32
    }
    
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
extension ConstrictorEdgeSnapshotTests {
    
    func testScenarioA() {
        view.constrictor
            .edge(to: viewController.view)
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func testScenarioB() {
        view.constrictor
            .edge(to: viewController.view, with: SnapshotConstants.Spacing.standard)
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func testScenarioC() {
        view.constrictor
            .edge(to: viewController.view, .leading, .trailing, .bottom, .top)
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func testScenarioD() {
        view.constrictor
            .edge(to: viewController.view, .leading, .trailing, .bottom, .top, with: .vertical(SnapshotConstants.Spacing.standard))
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func testScenarioE() {
        view.constrictor
            .edge(to: viewController.view, with: .vertical(SnapshotConstants.Spacing.standard))
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func testScenarioF() {
        view.constrictor
            .edge(to: viewController.view, .leading, .trailing, .bottom, .top, with: SnapshotConstants.Spacing.standard)
        
        assertSnapshot(matching: viewController, as: .image)
    }
}
