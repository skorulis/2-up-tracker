//
//  BetHistoryViewModel.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import Combine
import Foundation

final class BetHistoryViewModel: ObservableObject {
    
    let store: MainStore
    private var subscribers: Set<AnyCancellable> = []
    
    @Published var showingStats: Bool = false
    
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

extension BetHistoryViewModel {
    
    var bets: [BetEntry] {
        store.bets.reversed()
    }
    
    func showStats() {
        self.showingStats = true
    }
    
    func delete(at offsets: IndexSet) {
        var array = bets
        array.remove(atOffsets: offsets)
        store.bets = array.reversed()
    }
}
