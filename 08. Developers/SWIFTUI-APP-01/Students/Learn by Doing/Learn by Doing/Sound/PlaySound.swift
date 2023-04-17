//
//  PlaySound.swift
//  Learn by Doing
//
//  Created by Administrator on 17/04/23.
//

import Foundation
import AVFoundation

// MARK: - AUDIO PLAYER
var audioPlayer: AVAudioPlayer?

// MARK: - Func Play Sound
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch {
            print("Could not find and play the sound file!")
        }
    }
}
