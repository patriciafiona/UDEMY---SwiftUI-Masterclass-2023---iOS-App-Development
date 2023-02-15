//
//  PageModel.swift
//  pinch_image
//
//  Created by Other on 14/02/23.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumnailName: String {
        return "thumb-" + imageName
    }
}
