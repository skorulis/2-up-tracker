//Created by Alexander Skorulis on 8/4/2023.

import Foundation
@testable import TwoUpTracker
import XCTest

final class BetHistoryViewModelTests: XCTestCase {
    
    private let ioc = IOC()
    private lazy var store: MainStore = ioc.resolve()
    private lazy var sut: BetHistoryViewModel = ioc.resolve()
    
    func test_remove() {
        store.bets = [
            BetEntry(time: 1, amount: 100),
            BetEntry(time: 2, amount: -10),
            BetEntry(time: 3, amount: 50),
        ]
        
        sut.delete(at: .init(integer: 0))
        
        XCTAssertEqual(store.bets.count, 2)
        XCTAssertEqual(sut.bets.count, 2)
        XCTAssertEqual(store.bets, [BetEntry(time: 1, amount: 100), BetEntry(time: 2, amount: -10)])
    }
    
}
