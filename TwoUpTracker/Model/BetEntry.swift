//
//  BetEntry.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import Foundation

struct BetEntry: Codable, Equatable {
    
    let time: TimeInterval
    let amount: Int
    
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
}

extension BetEntry: Identifiable, Hashable {
    var id: TimeInterval { time }
    
    var timeString: String {
        let date = Date(timeIntervalSince1970: time)
        return Self.formatter.string(from: date)
    }
    
}
