//
//  CenterModifier.swift
//  Africa
//
//  Created by Patricia Fiona on 05/04/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
