//
//  Extensions.swift
//  Slot Machine
//
//  Created by Administrator on 26/04/23.
//

import SwiftUI

extension Text {
    func scoreLableStyle() -> Text {
        self
            .foregroundColor(.white)
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    
    func scoreNumberStyle() -> Text {
        self
            .foregroundColor(.white)
            .font(.system(.title, design: .rounded))
            .fontWeight(.bold)
    }
}
