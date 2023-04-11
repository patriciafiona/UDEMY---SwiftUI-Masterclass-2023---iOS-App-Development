//
//  Note.swift
//  Notes Watch App
//
//  Created by Administrator on 11/04/23.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
