//
//  BetHistoryView.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import Foundation
import SwiftUI

// MARK: - Memory footprint

struct BetHistoryView {
    
    @StateObject var viewModel: BetHistoryViewModel
}

// MARK: - Rendering

extension BetHistoryView: View {
    
    var body: some View {
        List {
            Text("History")
                .font(.title)
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
    }
}

// MARK: - Previews

struct BetHistoryView_Previews: PreviewProvider {
    
    static func previews(ioc: IOC) -> some View {
        BetHistoryView(viewModel: ioc.factory.resolve())
    }
    
    static var previews: some View {
        return previews(ioc: IOC())
    }
}

