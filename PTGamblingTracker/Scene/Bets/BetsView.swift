//
//  BetsView.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import Foundation
import SwiftUI

// MARK: - Memory footprint

struct BetsView {
    
    @StateObject var viewModel: BetsViewModel
}

// MARK: - Rendering

extension BetsView: View {
    
    var body: some View {
        VStack {
            Text("Current: $\(viewModel.runningTotal)")
                .font(.largeTitle)
            buttons
            Divider()
        }
    }
    
    private var buttons: some View {
        HStack {
            positiveBets
            negativeBets
        }
        .padding(.horizontal, 16)
    }
    
    private var positiveBets: some View {
        VStack {
            betButton(amount: 100)
            betButton(amount: 50)
            betButton(amount: 20)
            betButton(amount: 10)
            betButton(amount: 5)
        }
    }
    
    private var negativeBets: some View {
        VStack {
            betButton(amount: -100)
            betButton(amount: -50)
            betButton(amount: -20)
            betButton(amount: -10)
            betButton(amount: -5)
        }
    }
    
    private func betButton(amount: Int) -> some View {
        Button(action: {viewModel.addBet(amount: amount)}) {
            ZStack {
                Rectangle()
                    .fill(Color.bet(amount: amount))
                    .frame(height: 44)
                Text("$\(amount)")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
        }
    }
    
    
}

// MARK: - Previews

struct BetsView_Previews: PreviewProvider {
    
    static func previews(ioc: IOC) -> some View {
        BetsView(viewModel: ioc.factory.resolve())
    }
    
    static var previews: some View {
        return previews(ioc: .shared)
    }
}

