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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.factory, IOC.shared.factory)
        }
    }
}
