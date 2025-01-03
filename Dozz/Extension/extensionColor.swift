//
//  extensionColor.swift
//  Dozz
//
//  Created by Dylan Caetano on 26/06/2024.
//

import Foundation
import SwiftUI

extension Color {
    static let color1 = Color("ColorF")
    static let color2 = Color("ColorF1")
    static let color3 = Color("ColorT")
    static let color4 = Color("ColorTb")
    static let color5 = Color("ColorF2")
    static let colorText = Color("TextColor")
    static let gradient = LinearGradient(colors: [color1, color2],
                                         startPoint: .bottomTrailing,
                                         endPoint: .topLeading)
}
