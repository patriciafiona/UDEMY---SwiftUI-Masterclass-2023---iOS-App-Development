//
//  ContentView.swift
//  Learn by Doing
//
//  Created by Administrator on 13/04/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let data:[Card] = cardData
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(data) { item in
                    CardView(data: item)
                }
            }
            .padding()
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
