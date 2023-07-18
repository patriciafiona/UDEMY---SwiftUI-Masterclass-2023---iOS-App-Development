//
//  Created by Robert Petras
//  Credo Academy ♥ Design and Code
//  https://credo.academy
//

import SwiftUI

struct CustomCircleView: View {
  @State private var isAnimateGradient: Bool = false
  
  var body: some View {
    ZStack {
      Circle()
        .fill(
          LinearGradient(
            colors: [
              .customIndigoMedium,
              .customSalmonLight
            ],
            startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
            endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing
          )
        )
        .onAppear {
          withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
            isAnimateGradient.toggle()
          }
        }
      
      MotionAnimationView()
    } //: ZSTACK
    .frame(width: 256, height: 256)
  }
}

struct CustomCircleView_Previews: PreviewProvider {
  static var previews: some View {
    CustomCircleView()
  }
}
