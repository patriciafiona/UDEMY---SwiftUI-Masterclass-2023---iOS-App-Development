//
//  ContentView.swift
//  Slot Machine
//
//  Created by Patricia Fiona on 26/04/23.
//

import SwiftUI

struct MainView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    let haptics = UINotificationFeedbackGenerator()
    
    @State private var highscore: Int = UserDefaults.standard.integer(forKey: "HighScore")
    @State private var coins: Int = 100
    @State private var betAmount: Int = 10
    @State private var reels: Array = [0, 1, 2]
    @State private var showingInfoView: Bool = false
    @State private var isActiveBet10: Bool = true
    @State private var isActiveBet20: Bool = false
    @State private var showingModal: Bool = false
    @State private var animatingSymbol: Bool = false
    @State private var animatingModal: Bool = false
    
    // MARK: - FUNCTIONS
    
    func spinReels() {
      // reels[0] = Int.random(in: 0...symbols.count - 1)
      // reels[1] = Int.random(in: 0...symbols.count - 1)
      // reels[2] = Int.random(in: 0...symbols.count - 1)
      reels = reels.map({ _ in
        Int.random(in: 0...symbols.count - 1)
      })
      playSound(sound: "spin", type: "mp3")
      haptics.notificationOccurred(.success)
    }
    
    func checkWinning() {
      if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2] {
        // PLAYER WINS
        playerWins()
        
        // NEW HIGHSCORE
        if coins > highscore {
          newHighScore()
        } else {
          playSound(sound: "win", type: "mp3")
        }
      } else {
        // PLAYER LOSES
        playerLoses()
      }
    }
    
    func playerWins() {
      coins += betAmount * 10
    }
    
    func newHighScore() {
      highscore = coins
      UserDefaults.standard.set(highscore, forKey: "HighScore")
      playSound(sound: "high-score", type: "mp3")
    }
    
    func playerLoses() {
      coins -= betAmount
    }
    
    func activateBet20() {
      betAmount = 20
      isActiveBet20 = true
      isActiveBet10 = false
      playSound(sound: "casino-chips", type: "mp3")
      haptics.notificationOccurred(.success)
    }
    
    func activateBet10() {
      betAmount = 10
      isActiveBet10 = true
      isActiveBet20 = false
      playSound(sound: "casino-chips", type: "mp3")
      haptics.notificationOccurred(.success)
    }
    
    func isGameOver() {
      if coins <= 0 {
        showingModal = true
        playSound(sound: "game-over", type: "mp3")
      }
    }
    
    func resetGame() {
      UserDefaults.standard.set(0, forKey: "HighScore")
      highscore = 0
      coins = 100
      activateBet10()
      playSound(sound: "chimeup", type: "mp3")
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
            
            // MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5) {
                // MARK: - HEADER
                LogoView()
                
                Spacer()
                
                // MARK: - SCORE
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLableStyle()
                            .multilineTextAlignment(.trailing)
                        
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("\(highscore)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        
                        Text("High\nScore".uppercased())
                            .scoreLableStyle()
                            .multilineTextAlignment(.leading)
                    }
                    .modifier(ScoreContainerModifier())
                }
                
                // MARK: - SLOT MACHINE
                Spacer()
                
                VStack(alignment: .center, spacing: 0) {
                    // MARK: - REELS #1
                    ZStack {
                        ReelView()
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        // MARK: - REELS #2
                        ZStack {
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        
                        Spacer()
                        
                        // MARK: - REELS #3
                        ZStack {
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                    }
                    .frame(maxWidth: 500)
                    
                    // MARK: - SPIN BUTTON
                    Button(action: {
                        self.spinReels()
                        
                        self.checkWinning()
                    }) {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                }//: Slot Machine
                .layoutPriority(2)
                
                // MARK: - FOOTER
                Spacer()
                
                HStack {
                    // MARK: - BET 20
                    HStack(alignment: .center, spacing: 10) {
                      Button(action: {
                        self.activateBet20()
                      }) {
                        Text("20")
                          .fontWeight(.heavy)
                          .foregroundColor(isActiveBet20 ? Color("ColorYellow") : Color.white)
                          .modifier(BetNumberModifier())
                      }
                      .modifier(BetCapsuleModifier())
                      
                      Image("gfx-casino-chips")
                        .resizable()
                        .offset(x: isActiveBet20 ? 0 : 20)
                        .opacity(isActiveBet20 ? 1 : 0)
                        .modifier(CasinoChipsModifier())
                        .animation(.default, value: isActiveBet20)
                    }
                    
                    Spacer()
                    
                    // MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                      Image("gfx-casino-chips")
                        .resizable()
                        .offset(x: isActiveBet10 ? 0 : -20)
                        .opacity(isActiveBet10 ? 1 : 0)
                        .modifier(CasinoChipsModifier())
                        .animation(.default, value: isActiveBet10)
                      
                      Button(action: {
                        self.activateBet10()
                      }) {
                        Text("10")
                          .fontWeight(.heavy)
                          .foregroundColor(isActiveBet10 ? Color("ColorYellow") : Color.white)
                          .modifier(BetNumberModifier())
                      }
                      .modifier(BetCapsuleModifier())
                    }
                }
            }//:VSTACK
            .overlay(
                // RESET
                Button(action: {}) {
                    Image(systemName: "arrow.2.circlepath.circle")
                }
                .modifier(ButtonModifier()),
                alignment: .topLeading
            )
            .overlay(
                // INFO
                Button(action: {
                    self.showingInfoView = true
                }) {
                    Image(systemName: "info.circle")
                }
                .modifier(ButtonModifier()),
                alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
            
            // MARK: - POPUP
        }//: ZSTACK
        .sheet(isPresented: $showingInfoView) {
            InfoView()
        }
        .task {
            try? await Task.sleep(for: Duration.seconds(1.5))
            self.launchScreenState.dismiss()
        }
    }
}

// MARK: - PREVIEW
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
