//
//  LaunchScreenView.swift
//  Avocados
//
//  Created by Administrator on 17/04/23.
//
// Source: https://holyswift.app/animated-launch-screen-in-swiftui/

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
            Image("avocado")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .rotationEffect(firstAnimation ? Angle(degrees: 900) : Angle(degrees: 1800))
                .scaleEffect(secondAnimation ? 0 : 1)
            .offset(y: secondAnimation ? 400 : 0)
            
            Spacer()
                .frame(height: 30)
            
            Text("Avocados")
                .foregroundColor(.white)
                .font(.system(size: 45, weight: .bold, design: .serif))
        }
    }
    
    @ViewBuilder
    private var backgroundColor: some View {
        Image(colorScheme == .dark ? "background-dark" : "background")
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
