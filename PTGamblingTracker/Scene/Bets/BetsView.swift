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
        ScrollView {
            VStack {
                Text("Current: $\(viewModel.runningTotal)")
                    .font(.largeTitle)
                buttons
                Divider()
            }
            
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
        Button(action: {viewModel.addBet(value: amount)}) {
            ZStack {
                Rectangle()
                    .fill(color(amount: amount))
                    .frame(height: 44)
                Text("\(amount)")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
        }
    }
    
    private func color(amount: Int) -> Color {
        if amount < 0 {
            return Color("negative")
        } else {
            return Color("positive")
        }
    }
}

// MARK: - Previews

struct BetsView_Previews: PreviewProvider {
    
    static var previews: some View {
        BetsView(viewModel: .init())
    }
}

