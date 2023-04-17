//
//  ContentView.swift
//  Avocados
//
//  Created by Administrator on 17/04/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
        
    // MARK: - BODY
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LaunchScreenStateManager())
    }
}
