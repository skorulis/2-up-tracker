//Created by Alexander Skorulis on 7/4/2023.

import Foundation

struct PreviewData {
    
    static var bets: [BetEntry] {
        return [
            BetEntry(time: 1, amount: 50),
            BetEntry(time: 1000, amount: 20),
            BetEntry(time: 2000, amount: 50),
            BetEntry(time: 4000, amount: -50),
            BetEntry(time: 6000, amount: -40),
            BetEntry(time: 7000, amount: -40),
            BetEntry(time: 8000, amount: 20),
        ]
    }
    
}
