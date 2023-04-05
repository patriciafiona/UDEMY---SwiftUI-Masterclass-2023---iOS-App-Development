//
//  CreditsView.swift
//  Africa
//
//  Created by Administrator on 05/04/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
    Copyright © Patricia Fiona
    All right reserved
    Better Apps ❤️ Less Code
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        } //: End of VStack
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
