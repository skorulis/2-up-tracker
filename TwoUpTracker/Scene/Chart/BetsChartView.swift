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
        store.bets = PreviewData.bets
        return BetsChartView(viewModel: ioc.factory.resolve())
    }
}

