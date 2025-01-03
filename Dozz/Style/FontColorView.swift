//
//  FontColorView.swift
//  Dozz
//
//  Created by Dylan Caetano on 06/07/2024.
//

import SwiftUI

struct FontColorView: View {
    var body: some View {
        ZStack {
            Color.gradient.opacity(0.6).ignoresSafeArea()
           
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    FontColorView()
}
