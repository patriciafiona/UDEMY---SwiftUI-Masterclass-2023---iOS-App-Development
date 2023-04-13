//
//  CardModel.swift
//  Learn by Doing
//
//  Created by Administrator on 13/04/23.
//

import SwiftUI

struct Card: Identifiable {
    var id: UUID = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
