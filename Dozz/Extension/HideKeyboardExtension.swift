//
//  HideKeyboardExtension.swift
//  Dozz
//
//  Created by Dylan Caetano on 27/06/2024.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeuboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
