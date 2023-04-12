//
//  BetsChartViewModel.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import Combine
import Foundation

final class BetsChartViewModel: ObservableObject {
    
    let store: MainStore
    private var subscribers: Set<AnyCancellable> = []
    @Published var chartPoints: [RunningTotal] = []
    
    public init(store: MainStore) {
        self.store = store
        store.$bets
            .map { RunningTotal.generate(bets: $0)}
            .assign(to: &$chartPoints)
    }
    
}

// MARK: - Compute values

extension BetsChartViewModel {
    var minDate: Date {
        return chartPoints.first?.date ?? Date()
    }
    
    var maxDate: Date {
        return chartPoints.last?.date ?? Date()
    }
    
    var lines: [Line] {
        return [
            Line(name: "Total", points: chartPoints),
            Line(name: "LoseLine", points: [
                .init(time: minDate.timeIntervalSince1970, total: -100),
                .init(time: maxDate.timeIntervalSince1970, total: -100)
            ]),
            Line(name: "WinLine", points: [
                .init(time: minDate.timeIntervalSince1970, total: 100),
                .init(time: maxDate.timeIntervalSince1970, total: 100)
            ])
        ]
    }
}

// MARK: - Logic

extension BetsChartViewModel {
    
    var minX: Double {
        guard let bet = store.bets.first else {
            return Date().timeIntervalSince1970
        }
        return bet.time
    }
    
    var maxX: Double {
        guard let bet = store.bets.last else {
            return Date().timeIntervalSince1970 + 86400
        }
        return bet.time + 100
    }
    
    var minY: Int {
        let minTotal = chartPoints.map { $0.total }.min() ?? 0
        return min(minTotal, -400)
    }
    
    var maxY: Int {
        let maxTotal = chartPoints.map { $0.total }.max() ?? 0
        return max(maxTotal, 400)
    }
}

// MARK: - Inner types

extension BetsChartViewModel {
    
    struct Line: Identifiable {
        let name: String
        let points: [RunningTotal]
        
        var id: String { name }
    }
    
}
