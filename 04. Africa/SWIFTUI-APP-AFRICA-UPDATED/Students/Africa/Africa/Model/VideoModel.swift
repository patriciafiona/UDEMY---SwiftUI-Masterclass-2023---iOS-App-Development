//
//  VideoModel.swift
//  Africa
//
//  Created by Other on 17/02/23.
//

import Foundation


struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
