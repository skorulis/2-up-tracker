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
    
    var winPctString: String {
        return Self.pctFormatter.string(from: winPct as NSNumber)!
    }
    
    var playTimeString: String {
        Duration(secondsComponent: Int64(playTime), attosecondsComponent: 0)
            .formatted(.time(pattern: .hourMinute))
    }
    
    var playTime: TimeInterval {
        guard let first = store.bets.first,
              let last = store.bets.last else {
            return 0
        }
        return last.time - first.time
    }
    
    var winPct: Double {
        guard total > 0 else {
            return 0
        }
        return Double(wins) / Double(total)
    }
    
    var wageredString: String {
        return Self.currencyFormatter.string(from: wagered as NSNumber)!
    }
    
    var wagered: Int {
        return store.bets.reduce(0, {$0 + abs($1.amount)})
    }
    
    static let pctFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .percent
        nf.maximumFractionDigits = 0
        return nf
    }()
    
    static let currencyFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.maximumFractionDigits = 0
        return nf
    }()
    
}
