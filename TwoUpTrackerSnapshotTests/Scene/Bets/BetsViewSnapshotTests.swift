//Created by Alexander Skorulis on 12/4/2023.

import Foundation
import SnapshotTesting
@testable import TwoUpTracker
import XCTest

final class BetsViewSnapshotTests: XCTestCase {
    
    private let ioc = IOC()
    
    func test_previews() {
        let view = BetsView_Previews.previews
        assertSnapshot(view: view)
    }
    
}
