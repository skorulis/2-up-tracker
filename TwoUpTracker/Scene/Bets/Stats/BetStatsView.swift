//Created by Alexander Skorulis on 7/4/2023.

import ASKDesignSystem
import Foundation
import SwiftUI

// MARK: - Memory footprint

struct BetStatsView {
    @StateObject var viewModel: BetStatsViewModel
}

// MARK: - Rendering

extension BetStatsView: View {
    
    var body: some View {
        PageTemplate(nav: nav, content: content)
    }
    
    private func nav() -> some View {
        NavBar(mid: NavBarItem.title("Statistics"))
    }
    
    @ViewBuilder
    private func content() -> some View {
        if viewModel.total > 0 {
            filled
        } else {
            Text("Stats will show after making bets")
        }
    }
    
    private var filled: some View {
        VStack {
            row("Wagered", viewModel.wageredString)
            row("Bets", "\(viewModel.total)")
            row("Wins", "\(viewModel.wins)")
            row("Losses", "\(viewModel.losses)")
            row("Win Percentage", viewModel.winPctString)
            row("Play time", viewModel.playTimeString)
        }
        .padding(.horizontal, 32)
    }
    
    private func row(_ title: String, _ value: String) -> some View {
        HStack {
            Text(title)
                .typography(.title)
            Spacer()
            Text(value)
                .typography(.subtitle)
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

