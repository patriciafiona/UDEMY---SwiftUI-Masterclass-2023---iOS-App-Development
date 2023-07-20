//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Administrator on 20/07/23.
//

import SwiftUI

struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .foregroundColor(Color.pink)
  }
}
