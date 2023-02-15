//
//  FruitModel.swift
//  Fructus
//
//  Created by Other on 15/02/23.
//

import SwiftUI


//MARK: - FRUITS Data Model
struct Fruit: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
