//
//  Constants.swift
//  Devote
//
//  Created by Administrator on 10/04/23.
//

import SwiftUI

// MARK: - FORMATER
let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: - UI
var backgroundGradient: LinearGradient {
  return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

// MARK: - UX
let feedback = UINotificationFeedbackGenerator()
