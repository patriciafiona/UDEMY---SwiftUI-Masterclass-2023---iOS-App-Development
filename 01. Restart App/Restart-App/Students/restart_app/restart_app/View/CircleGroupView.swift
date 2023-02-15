//
//  CircleGroupView.swift
//  restart_app
//
//  Created by Other on 14/02/23.
//

import SwiftUI

struct CircleGroupView: View {
    //MARK: - STATE
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1:0)
        .scaleEffect(isAnimating ? 1: 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            CircleGroupView(
                ShapeColor: Color.white,
                ShapeOpacity: 0.2
            )
        }
    }
}
