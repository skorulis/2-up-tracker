//  Created by Alexander Skorulis on 23/4/2022.

import Foundation
import SwiftUI
import ASSwiftUI

// MARK: - Memory footprint

struct BetsChartView {
    
    @StateObject var viewModel: BetsChartViewModel
    
}

// MARK: - Rendering

extension BetsChartView: View {
    
    var body: some View {
        chart
    }
    
    var chart: some View {
        let xScale = ChartViewScale(min: viewModel.minX, max: viewModel.maxX)
        let yScale = ChartViewScale(min: CGFloat(viewModel.minY), max: CGFloat(viewModel.maxY))
        
        let yAxis = AnyView(VerticalAxis(ticks: 5, formatValue: { (value) -> String in
            let i = Int(value)
            return "$\(i)"
        }))
        
        return ChartView(
            xScale: xScale,
            yScale: yScale,
            elements: [
                AnyView(ZeroLineView()),
                AnyView(LineChartView(points: viewModel.chartPoints)),
                yAxis
                ]
        )
    }
}

// MARK: - Previews

struct BetsChartView_Previews: PreviewProvider {
    
    static func previews(ioc: IOC) -> some View {
        BetsChartView(viewModel: ioc.factory.resolve())
    }
    
    static var previews: some View {
        return previews(ioc: .shared)
    }
}

