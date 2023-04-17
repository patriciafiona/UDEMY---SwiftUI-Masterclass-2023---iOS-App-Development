//
//  FactModel.swift
//  Avocados
//
//  Created by Administrator on 17/04/23.
//

import SwiftUI

// MARK: - FACT MODEL
struct Fact: Identifiable {
  var id = UUID()
  var image: String
  var content: String 
}
