//
//  LaunchScreenStateManager.swift
//  Slot Machine
//
//  Created by Patricia Fiona on 26/04/23.
//

import Foundation

final class LaunchScreenStateManager: ObservableObject {
@MainActor @Published private(set) var state: LaunchScreenStep = .firstStep
    
    @MainActor func dismiss() {
        Task {
            state = .secondStep

            try? await Task.sleep(for: Duration.seconds(1))

            self.state = .finished
        }
    }
}
