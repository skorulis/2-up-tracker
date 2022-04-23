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
            
        }
    }
    
    init() {
        bets.append(.init(time: 0, amount: 100))
    }
    
}
