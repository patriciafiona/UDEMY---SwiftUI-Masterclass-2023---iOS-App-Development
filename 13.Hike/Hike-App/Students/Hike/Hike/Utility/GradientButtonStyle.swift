//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Administrator on 18/07/23.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration
      .label
      .padding(.vertical)
      .padding(.horizontal, 30)
      .background(
        // Conditional Statement with Nil Coalescing
        // Condition ? A : B
        configuration.isPressed ?
        // A: When User pressed the Button
        LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom)
        :
        // B: When the Button is not pressed
        LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
      )
      .cornerRadius(40)
  }
}
