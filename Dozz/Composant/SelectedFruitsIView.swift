//
//  SelectedFruitsIView.swift
//  Dozz
//
//  Created by Dylan Caetano on 06/07/2024.
//

import SwiftUI

struct SelectedFruitsView: View {
    
    @Binding var selectedFruits: Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    @State var isSelect = false
    return SelectedFruitsView(selectedFruits: $isSelect)
}
