//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Administrator on 05/04/23.
//

import Foundation


struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
