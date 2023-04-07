//Created by Alexander Skorulis on 7/4/2023.

import Foundation
import SnapshotTesting
@testable import TwoUpTracker
import XCTest

final class BetsChartViewSnapshotTests: XCTestCase {
    
    private let ioc = IOC()
    
    func test_previews() {
        let view = BetsChartView_Previews.previews(ioc: ioc)
        assertSnapshot(view: view)
    }
    
    func test_filled() {
        let store = ioc.resolve(MainStore.self)!
        store.bets = [
            .init(time: 1, amount: 50),
            .init(time: 100, amount: 20),
            .init(time: 200, amount: 50),
            .init(time: 400, amount: -50),
            .init(time: 600, amount: -40),
            .init(time: 1000, amount: -40),
        ]
        
        let view = BetsChartView(viewModel: self.ioc.resolve())
        assertSnapshot(view: view)
    }
    
}
