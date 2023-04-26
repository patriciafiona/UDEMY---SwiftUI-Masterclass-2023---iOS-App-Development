//
//  Slot_MachineApp.swift
//  Slot Machine
//
//  Created by Patricia Fiona on 26/04/23.
//

import SwiftUI

@main
struct Slot_MachineApp: App {
    @StateObject var launchScreenState = LaunchScreenStateManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                MainView()
                
                if launchScreenState.state != .finished {
                    LaunchScreenView()
                }
            }.environmentObject(launchScreenState)
        }
    }
}
