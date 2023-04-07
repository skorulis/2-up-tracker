//  Created by Alexander Skorulis on 23/4/2022.

import ASKDesignSystem
import Foundation
import SwiftUI

// MARK: - Memory footprint

struct BetHistoryView {
    
    @StateObject var viewModel: BetHistoryViewModel
}

// MARK: - Rendering

extension BetHistoryView: View {
    
    var body: some View {
        ListTemplate(nav: nav, content: content)
    }
    
    private func content() -> some View {
        ForEach(viewModel.store.bets.reversed(), id: \.self) { bet in
            HStack {
                Text(bet.timeString)
                Spacer()
                Text("$\(bet.amount)")
                    .foregroundColor(.bet(amount: bet.amount))
            }
            
        }
        .onDelete(perform: viewModel.delete(at:))
    }
    
    private func nav() -> some View {
        NavBar(mid: NavBarItem.title("History"))
    }
}

// MARK: - Previews

struct BetHistoryView_Previews: PreviewProvider {
    
    static func previews(ioc: IOC) -> some View {
        BetHistoryView(viewModel: ioc.factory.resolve())
    }
    
    static var previews: some View {
        previews(ioc: IOC())
        filled
    }
    
    static var filled: some View {
        let ioc = IOC()
        let store = ioc.resolve(MainStore.self)!
        store.bets = PreviewData.bets
        return BetHistoryView(viewModel: ioc.resolve())
    }
}

