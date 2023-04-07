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
        assertSnapshot(view: BetsChartView_Previews.filledPreview)
    }
    
}
