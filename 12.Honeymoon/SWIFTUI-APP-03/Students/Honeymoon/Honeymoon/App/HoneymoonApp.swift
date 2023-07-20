//
//  HoneymoonApp.swift
//  Honeymoon
//
//  Created by Administrator on 20/07/23.
//

import SwiftUI

@main
struct HoneymoonApp: App {
    @StateObject var launchScreenState = LaunchScreenStateManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                
                if launchScreenState.state != .finished {
                    LaunchScreenView()
                }
            }.environmentObject(launchScreenState)
        }
    }
}
