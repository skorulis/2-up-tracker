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
    
    func showStats() {
        self.showingStats = true
    }
    
    func delete(at offsets: IndexSet) {
        store.bets.remove(atOffsets: offsets)
    }
}
