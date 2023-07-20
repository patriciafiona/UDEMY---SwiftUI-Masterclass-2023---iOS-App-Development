//
//  ContentView.swift
//  Honeymoon
//
//  Created by Administrator on 20/07/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
        @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
        
        // MARK: - BODY
        var body: some View {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
            .task {
                try? await Task.sleep(for: Duration.seconds(1))
                self.launchScreenState.dismiss()
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
