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
    var date: Date {
        return Date(timeIntervalSince1970: time)
    }
}

extension RunningTotal {
    
    static func generate(bets: [BetEntry]) -> [RunningTotal] {
        guard let firstBet = bets.first else {
            return []
        }
        var total: Int = 0
        var result: [RunningTotal] = []
        result.append(.init(time: firstBet.time - 60, total: 0))
        for bet in bets {
            total += bet.amount
            result.append(.init(time: bet.time, total: total))
        }
        return result
    }
}
