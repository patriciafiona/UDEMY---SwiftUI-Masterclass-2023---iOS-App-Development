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
                        .padding()
                    Text("Avocado")
                })
            
            ContentView()
                .tabItem({
                    Image("tabicon-book")
                        .padding()
                    Text("Recipes")
                })
            
            RipeningStagesView()
                .tabItem({
                    Image("tabicon-avocado")
                        .padding()
                    Text("Ripening")
                })
            
            SettingView()
                .tabItem({
                    Image("tabicon-settings")
                        .padding()
                    Text("Settings")
                })
        }
        .task {
            try? await Task.sleep(for: Duration.seconds(1))
            self.launchScreenState.dismiss()
        }
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

// MARK: - PREVIEW
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
