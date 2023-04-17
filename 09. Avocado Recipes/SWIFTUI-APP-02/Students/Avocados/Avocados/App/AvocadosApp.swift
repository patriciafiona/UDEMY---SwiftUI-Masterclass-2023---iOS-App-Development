//
//  AvocadosApp.swift
//  Avocados
//
//  Created by Administrator on 17/04/23.
//

import SwiftUI

@main
struct AvocadosApp: App {
    
    @StateObject var launchScreenState = LaunchScreenStateManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                AppView()
                
                if launchScreenState.state != .finished {
                    LaunchScreenView()
                }
            }.environmentObject(launchScreenState)
        }
    }
}
