//Created by Alexander Skorulis on 7/4/2023.

import Foundation
import SwiftUI

// MARK: - Memory footprint

struct BetStatsView {
    @StateObject var viewModel: BetStatsViewModel
}

// MARK: - Rendering

extension BetStatsView: View {
    
    var body: some View {
        if viewModel.total > 0 {
            filled
        } else {
            Text("Stats will show after making bets")
        }
    }
    
    private var filled: some View {
        VStack {
            Text("Bets: \(viewModel.total)")
            Text("Wagered $\(viewModel.wagered)")
            Text("Wins: \(viewModel.wins)")
            Text("Losses: \(viewModel.losses)")
            Text("Pct: \(viewModel.winPct)")
        }
    }
}

// MARK: - Previews

struct BetStatsView_Previews: PreviewProvider {
    
    static var previews: some View {
        let ioc = IOC()
        ioc.resolve(MainStore.self)?.bets = PreviewData.bets
        return BetStatsView(viewModel: ioc.resolve())
    }
}

