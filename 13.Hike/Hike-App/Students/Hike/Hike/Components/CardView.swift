//
//  CardView.swift
//  Hike
//
//  Created by Administrator on 18/07/23.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        // MARK: - Card
        ZStack{
            CustomBackgroundView()
            
            // MARK: - <#Description#>
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.customIndigoMedium, Color.customSalmonLight],
                            startPoint: .topLeading,
                            endPoint: .bottomLeading
                        )
                    )
                    .frame(width: 256, height: 256)
                
                Image("image-1")
                    .resizable()
                    .scaledToFit()
            }
        }//: Card
        .frame(width: 320, height: 570)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
