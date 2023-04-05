//
//  ContentView.swift
//  Touchdown
//
//  Created by Administrator on 05/04/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    // MARK: - NAVBAR
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, UIApplication
                            .shared
                            .connectedScenes
                            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                            .first { $0.isKeyWindow }?.safeAreaInsets.top)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                    ScrollView(.vertical, showsIndicators: false) {
                        // MARK: - CAROUSEL
                        FeaturedTabView()
                            .frame(height: UIScreen.main.bounds.width / 1.475) // This will fix the layout rendering priority issue by using the screen's aspect ratio.
                            .padding(.vertical, 20)
                        
                        CategoryGridView()
                        
                        // MARK: - PRODUCTS
                        TitleView(title: "Helmets")
                        LazyVGrid(columns: gridLayout, spacing: 15) {
                            ForEach(products) { product in
                                ProductItemView(product: product)
                                    .onTapGesture {
                                        feedback.impactOccurred()
                                        
                                        withAnimation(.easeOut) {
                                            shop.selectedProduct = product
                                            shop.showingProduct = true
                                        }
                                    }
                            }//: LOOP
                        }//: GRID
                        .padding(15)
                        
                        // MARK: - BRANDS
                        TitleView(title: "Brands")
                        BrandGridView()
                        
                        // MARK: - FOOTER
                        VStack(spacing: 0){
                            FooterView()
                                .padding(.horizontal)
                        }//: VSTACK
                    }//: SCROLLVIEW
                }//: VSTACK
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            }else{
                ProductDetailView()
            }
        }//: ZSTACK
        .ignoresSafeArea(.all, edges: .top)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
