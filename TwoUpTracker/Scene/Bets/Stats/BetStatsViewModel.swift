//Created by Alexander Skorulis on 7/4/2023.

import Foundation

final class BetStatsViewModel: ObservableObject {
    
    private let store: MainStore
    
    init(store: MainStore) {
        self.store = store
    }
}

// MARK: - Computed values

extension BetStatsViewModel {
    
    var total: Int {
        return store.bets.count
    }
    
    var wins: Int {
        return store.bets.filter { $0.amount > 0 }.count
    }
    
    var losses: Int {
        return store.bets.filter { $0.amount < 0 }.count
    }
    
    var winPct: Double {
        guard total > 0 else {
            return 0
        }
        return Double(wins) / Double(total)
    }
    
    var wagered: Int {
        return store.bets.reduce(0, {$0 + abs($1.amount)})
    }
}
