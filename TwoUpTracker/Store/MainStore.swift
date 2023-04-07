//  Created by Alexander Skorulis on 23/4/2022.

import ASKCore
import Foundation

final class MainStore: ObservableObject {
    
    @Published var bets: [BetEntry] = [] {
        didSet {
            try! keyValueStore.set(codable: bets, forKey: Self.betsKey)
        }
    }
    
    @Published var limit: Int {
        didSet {
            keyValueStore.set("\(limit)", forKey: Self.limitsKey)
        }
    }
    
    let keyValueStore: PKeyValueStore
    static let betsKey: String = "betsKey"
    static let limitsKey: String = "limitsKey"
    
    init(keyValueStore: PKeyValueStore) {
        self.keyValueStore = keyValueStore
        self.bets = try! keyValueStore.codable(forKey: Self.betsKey) ?? []
        if let number = keyValueStore.string(forKey: Self.limitsKey) {
            self.limit = Int(number) ?? 100
        } else {
            self.limit = 100
        }
    }
    
}
