//
//  ContentView.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import ASKCore
import SwiftUI

struct ContentView: View {
    
    @Environment(\.factory) private var factory
    
    var body: some View {
        TabView {
            bets
            history
            charts
            scale
        }
    }
    
    private var history: some View {
        BetHistoryView(viewModel: factory.resolve())
            .tabItem {
                Text("History")
            }
    }
    
    private var bets: some View {
        BetsView(viewModel: factory.resolve())
            .tabItem {
                Text("Bets")
            }
    }
    
    private var scale: some View {
        ScaleOfPTView()
            .tabItem {
                Text("Scale")
            }
    }
    
    private var charts: some View {
        BetsChartView(viewModel: factory.resolve())
            .tabItem {
                Text("Charts")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
