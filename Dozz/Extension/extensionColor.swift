//
//  extensionColor.swift
//  Dozz
//
//  Created by Dylan Caetano on 26/06/2024.
//

import Foundation
import SwiftUI

extension Color {
    static let color1 = Color("ColorOne")
    static let color2 = Color("ColorTwo")
    static let colorText = Color("TextColor")
    static let color3 = Color("ColorThree")
    static let gradient = LinearGradient(colors: [color1, color2],
                                         startPoint: .bottomTrailing,
                                         endPoint: .topLeading)
}
