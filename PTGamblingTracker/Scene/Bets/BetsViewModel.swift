//
//  BetsViewModel.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import Combine
import Foundation

final class BetsViewModel: ObservableObject {
 
    let store: MainStore
    private var subscribers: Set<AnyCancellable> = []
    
    public init(store: MainStore) {
        self.store = store
        store.objectWillChange
            .sink { [unowned self] _ in
                self.objectWillChange.send()
            }
            .store(in: &subscribers)
    }
    
}

// MARK: - Logic

extension BetsViewModel {
    
    var runningTotal: Int {
        return store.bets.map { $0.amount }.reduce(0, +)
    }
    
}

// MARK: - Behaviors

extension BetsViewModel {
    
    func addBet(amount: Int) {
        let bet = BetEntry(time: Date().timeIntervalSince1970, amount: amount)
        store.bets.append(bet)
    }
    
}
