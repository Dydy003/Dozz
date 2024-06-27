//
//  Constant.swift
//  Dozz
//
//  Created by Dylan Caetano on 26/06/2024.
//

import SwiftUI

// MARK: - FORMATTER

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()


// MARK: UI
var bacgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.color1, Color.color2]), startPoint: .topTrailing, endPoint: .bottomLeading)
}
