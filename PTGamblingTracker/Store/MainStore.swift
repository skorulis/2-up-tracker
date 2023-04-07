//  Created by Alexander Skorulis on 23/4/2022.

import ASKCore
import Foundation

final class MainStore: ObservableObject {
    
    @Published var bets: [BetEntry] = [] {
        didSet {
            let data = try! JSONEncoder().encode(bets)
            keyValueStore.set(data, forKey: Self.betsKey)
        }
    }
    
    let keyValueStore: PKeyValueStore
    static let betsKey: String = "betsKey"
    
    init(keyValueStore: PKeyValueStore) {
        self.keyValueStore = keyValueStore
        if let data = keyValueStore.data(forKey: Self.betsKey),
           let obj = try? JSONDecoder().decode([BetEntry].self, from: data) {
            self.bets = obj
        }
    }
    
}
