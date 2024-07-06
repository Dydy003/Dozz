//
//  FontColorView.swift
//  Dozz
//
//  Created by Dylan Caetano on 06/07/2024.
//

import SwiftUI

struct FontColorView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color.gradient.opacity(0.4).ignoresSafeArea())
    }
}

#Preview {
    FontColorView()
}
