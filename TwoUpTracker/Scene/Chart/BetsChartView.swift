//  Created by Alexander Skorulis on 23/4/2022.

import Charts
import Foundation
import SwiftUI

// MARK: - Memory footprint

struct BetsChartView {
    
    @StateObject var viewModel: BetsChartViewModel
    
}

// MARK: - Rendering

extension BetsChartView: View {
    
    var body: some View {
        if viewModel.chartPoints.count < 2 {
            Text("Empty")
        } else {
            simpleChart
        }
    }
    
    var simpleChart: some View {
        Chart {
            ForEach(viewModel.chartPoints) { point in
                LineMark(
                    x: .value("Time", point.date),
                    y: .value("$", point.total)
                )
            }
        }
    }
    
    var chart: some View {
        Chart {
            ForEach(viewModel.lines) { line in
                ForEach(line.points) { point in
                    LineMark(
                        x: .value("Time", point.date),
                        y: .value("$", point.total))
                }
                .foregroundStyle(by: .value("name", line.name))
            }
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .hour))
        }
        .chartLegend(.hidden)
    }
    
}

// MARK: - Previews

struct BetsChartView_Previews: PreviewProvider {
    
    static func previews(ioc: IOC) -> some View {
        BetsChartView(viewModel: ioc.factory.resolve())
    }
    
    static var previews: some View {
        previews(ioc: IOC())
        filledPreview
    }
    
    static var filledPreview: some View {
        let ioc = IOC()
        let store = ioc.resolve(MainStore.self)!
        store.bets = [
            BetEntry(time: 1, amount: 50),
            BetEntry(time: 1000, amount: 20),
            BetEntry(time: 2000, amount: 50),
            BetEntry(time: 4000, amount: -50),
            BetEntry(time: 6000, amount: -40),
            BetEntry(time: 7000, amount: -40),
            BetEntry(time: 8000, amount: 20),
        ]
        return BetsChartView(viewModel: ioc.factory.resolve())
    }
}

