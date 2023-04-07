//
//  PTGamblingTrackerApp.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import SwiftUI
import ASKCore

@main
struct PTGamblingTrackerApp: App {
    
    let ioc: IOC = IOC(purpose: .normal)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.factory, ioc.factory)
        }
    }
}
