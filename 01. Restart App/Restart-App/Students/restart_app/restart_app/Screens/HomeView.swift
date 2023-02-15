//
//  HomeView.swift
//  restart_app
//
//  Created by Other on 14/02/23.
//

import SwiftUI
import UIKit


struct HomeView: View {
    //MARK: - PROPERTY
    @AppStorage("onboarding") var isOnBoardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                //MARK: - HEADER
                Spacer()
                
                ZStack {
                    CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                    
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 35:-35)
                        .animation(
                            Animation
                                .easeOut(duration: 4)
                                .repeatForever(),
                            value: isAnimating)
                }
                //MARK: - CENTER
                Text("""
                The time that leads to mastery is dependent on the intensity of out focus.
                """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                //MARK: - FOOTER
                Spacer()
                
                Button(
                    action: {
                        withAnimation {
                            playSound(sound: "success", type: "m4a")
                            isOnBoardingViewActive = true
                        }
                    }
                ) {
                    Image(systemName: "arrow.traingle.2.circlepath.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.white)
                    
                    Text("Restart")
                        .font(.system(.title3))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }//: BUTTON
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            } //: VSTACK
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    isAnimating = true
                })
            })
        } //: ZSTACK
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
