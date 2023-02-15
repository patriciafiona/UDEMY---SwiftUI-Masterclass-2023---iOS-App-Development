//
//  OnboardingView.swift
//  Fructus
//
//  Created by Other on 15/02/23.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - PROPERTIES
    var fruits: [Fruit] = fruitData
    
    //MARK: - BODY
    var body: some View {
        TabView {
            ForEach(fruits[0...5]) { item in
                FruitCardView(fruit: item)
            }//: Loop
        }//: Tabview
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

//MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(fruits: fruitData)
    }
}
