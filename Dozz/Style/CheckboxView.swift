//
//  CheckboxView.swift
//  Dozz
//
//  Created by Dylan Caetano on 11/09/2024.
//

import SwiftUI

struct CheckboxView: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(configuration.isOn ? Color.colorText : .colorText)
                .font(.system(size: 35, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}

#Preview {
    Toggle("Label", isOn: .constant(false))
        .toggleStyle(CheckboxView())
        .padding()
}
