//
//  Shop.swift
//  Touchdown
//
//  Created by Administrator on 05/04/23.
//

import Foundation

class Shop: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: Product? //= nil 
}
