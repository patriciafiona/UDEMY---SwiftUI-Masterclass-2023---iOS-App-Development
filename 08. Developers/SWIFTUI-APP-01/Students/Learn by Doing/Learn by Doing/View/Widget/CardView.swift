//
//  CardView.swift
//  Learn by Doing
//
//  Created by Administrator on 13/04/23.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    var data: Card
    var gradients: [Color] = [Color("Color01"), Color("Color02")]
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image(data.imageName)
            
            VStack {
                Text(data.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text(data.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
            }
            .offset(y: -218)
            
            Button(action: {}) {
                HStack {
                    Text(data.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .accentColor(.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(.white)
                }
                .padding()
                .background(
                    LinearGradient(colors: data.gradientColors, startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow") ,radius: 6, x: 0, y: 3)
            }
            .offset(y: 210)
        }
        .frame(width: 335, height: 545)
        .background(
            LinearGradient(colors: data.gradientColors, startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(16)
        .shadow(radius: 8)
    }
}

// MARK: - PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(data: cardData[3])
            .previewLayout(.sizeThatFits)
    }
}
