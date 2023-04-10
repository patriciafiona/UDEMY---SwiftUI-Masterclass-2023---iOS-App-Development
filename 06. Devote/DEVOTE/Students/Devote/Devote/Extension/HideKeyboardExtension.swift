//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Administrator on 10/04/23.
//

import SwiftUI

#if canImport(UIKit)
extension View{
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
