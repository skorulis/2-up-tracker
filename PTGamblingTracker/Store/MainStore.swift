//
//  MainStore.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import Foundation

final class MainStore: ObservableObject {
    
    @Published var bets: [BetEntry] = [] {
        didSet {
            let data = try! JSONEncoder().encode(bets)
            defaults.set(data, forKey: Self.betsKey)
            defaults.synchronize()
        }
    }
    
    var defaults: UserDefaults = UserDefaults.standard
    static let betsKey: String = "betsKey"
    
    init() {
        if let data = defaults.data(forKey: Self.betsKey),
           let obj = try? JSONDecoder().decode([BetEntry].self, from: data) {
            self.bets = obj
        }
    }
    
}
