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
    
    public init(store: MainStore) {
        self.store = store
        store.objectWillChange
            .sink { [unowned self] _ in
                self.objectWillChange.send()
            }
            .store(in: &subscribers)
    }
}

// MARK: - Behaviors

extension BetHistoryViewModel {
    
    func delete(at offsets: IndexSet) {
        store.bets.remove(atOffsets: offsets)
    }
}
