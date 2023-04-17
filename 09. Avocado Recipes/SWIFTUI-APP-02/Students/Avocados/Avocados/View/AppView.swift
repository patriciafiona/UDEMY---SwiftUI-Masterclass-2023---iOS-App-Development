//
//  AppView.swift
//  Avocados
//
//  Created by Administrator on 17/04/23.
//

import SwiftUI

struct AppView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    
    // MARK: - BODY
    var body: some View {
        TabView {
            AvocadosView()
                .tabItem({
                    Image("tabicon-branch")
                    Text("Avocado")
                })
            
            ContentView()
                .tabItem({
                    Image("tabicon-book")
                    Text("Recipes")
                })
            
            RipeningStagesView()
                .tabItem({
                    Image("tabicon-avocado")
                    Text("Ripening")
                })
            
            SettingView()
                .tabItem({
                    Image("tabicon-settings")
                    Text("Settings")
                })
        }
        .task {
            try? await Task.sleep(for: Duration.seconds(1))
            self.launchScreenState.dismiss()
        }
    }
}

// MARK: - PREVIEW
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
