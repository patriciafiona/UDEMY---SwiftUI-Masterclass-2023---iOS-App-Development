//
//  StartButtonView.swift
//  Fructus
//
//  Created by Other on 15/02/23.
//

import SwiftUI

struct StartButtonView: View {
    //MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    //MARK: - BODY
    var body: some View {
        Button(action: {
            isOnboarding = false
        }){
            HStack(spacing: 8) {
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(.white, lineWidth: 1.25)
            )
        }//: Button
        .accentColor(.white)
    }
}

//MARK: - PREVIEW
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StartButtonView()
                .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
        }
    }
}
