//
//  ContentView.swift
//  restart_app
//
//  Created by Other on 14/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnBoardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnBoardingViewActive {
                OnBoardingView()
            } else {
                HomeView()
            }
        }//: ZSTACK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
