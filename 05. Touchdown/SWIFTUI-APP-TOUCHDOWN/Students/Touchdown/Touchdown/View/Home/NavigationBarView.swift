//
//  NavigationBarView.swift
//  Touchdown
//
//  Created by Administrator on 05/04/23.
//

import SwiftUI

struct NavigationBarView: View {
    // MARK: - PROPERTIES
    @State private var isAnimated: Bool = false
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Button(
                action: {}
            ) {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.black)
            }//:SEARCH BUTTON
            
            Spacer()
            
            LogoView()
                .opacity(isAnimated ? 1:0)
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear(){
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimated = true
                    }
                }
            
            Spacer()
            
            Button(
                action: {}
            ) {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                    .foregroundColor(.black)
                    
                    Circle()
                        .fill(.red)
                        .frame(width: 14, height: 14, alignment: .center)
                        .offset(x: 13, y: -10)
                }
            }//: CART BUTTON
        } //: HSTACK
    }
}


// MARK: - PREVIEW
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
