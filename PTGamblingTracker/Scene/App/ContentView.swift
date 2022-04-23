//
//  ContentView.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            scale
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
