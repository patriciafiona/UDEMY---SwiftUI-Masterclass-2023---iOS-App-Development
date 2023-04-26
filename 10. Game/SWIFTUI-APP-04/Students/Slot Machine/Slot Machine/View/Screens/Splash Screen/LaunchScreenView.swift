//
//  SplashView.swift
//  Slot Machine
//
//  Created by Patricia Fiona on 26/04/23.
//

import SwiftUI

struct LaunchScreenView: View {
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager

    @State private var firstAnimation = false
    @State private var secondAnimation = false
    @State private var startFadeoutAnimation = false
    
    @Environment(\.colorScheme) var colorScheme
    
    @ViewBuilder
    private var image: some View {
        VStack {
            Image("gfx-slot-machine")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .rotationEffect(firstAnimation ? Angle(degrees: 10) : Angle(degrees: -10))
                .scaleEffect(secondAnimation ? 0 : 1)
            .offset(y: secondAnimation ? 400 : 0)
        }
    }
    
    @ViewBuilder
    private var backgroundColor: some View {
        Image("gfx-background")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
    
    private let animationTimer = Timer
        .publish(every: 0.5, on: .current, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            backgroundColor
            image
        }.onReceive(animationTimer) { timerValue in
            updateAnimation()
        }.opacity(startFadeoutAnimation ? 0 : 1)
    }
    
    private func updateAnimation() {
        switch launchScreenState.state {
        case .firstStep:
            withAnimation(.easeInOut(duration: 0.9)) {
                firstAnimation.toggle()
            }
        case .secondStep:
            if secondAnimation == false {
                withAnimation(.linear) {
                    self.secondAnimation = true
                    startFadeoutAnimation = true
                }
            }
        case .finished:
            // use this case to finish any work needed
            break
        }
    }
    
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .environmentObject(LaunchScreenStateManager())
    }
}
