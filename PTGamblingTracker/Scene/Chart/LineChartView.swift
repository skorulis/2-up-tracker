//
//  LineChartView.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import Foundation
import ASSwiftUI

import SwiftUI

// MARK: - Memory footprint

struct LineChartView {
    
    let points: [RunningTotal]
    @Environment(\.xScale) var xScale
    @Environment(\.yScale) var yScale
    
    public init(points: [RunningTotal]) {
        self.points = points
    }
}

// MARK: - Rendering

extension LineChartView: View {
    
    public var body: some View {
        var isFirst = true
        Path { path in
            path.move(to: .zero)
            for p in points {
                let x = xScale.toView(v: p.time)
                let y = yScale.toView(v: CGFloat(p.total))
                if isFirst {
                    path.move(to: CGPoint(x: x, y: y))
                    isFirst = false
                } else {
                    path.addLine(to: CGPoint(x: x, y: y))
                }
            }
        }
        .stroke(Color.blue, lineWidth: 2)
    }
}
