//
//  ContentView.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var factory: GenericFactory
    
    var body: some View {
        TabView {
            bets
            scale
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
