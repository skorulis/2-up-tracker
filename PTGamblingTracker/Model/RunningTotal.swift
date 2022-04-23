//
//  RunningTotal.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import Foundation

struct RunningTotal: Identifiable {
    
    let time: TimeInterval
    let total: Int
    
    var id: TimeInterval { time }
}

extension RunningTotal {
    
    static func generate(bets: [BetEntry]) -> [RunningTotal] {
        var total: Int = 0
        var result: [RunningTotal] = []
        for bet in bets {
            total += bet.amount
            result.append(.init(time: bet.time, total: total))
        }
        return result
    }
}
