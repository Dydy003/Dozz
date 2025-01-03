//
//  SelectedFruitsIView.swift
//  Dozz
//
//  Created by Dylan Caetano on 06/07/2024.
//

import SwiftUI

struct SelectedFruitsView: View {
    
    @Binding var selectedFruits: String
    
    private let fruits = [
        "Food",
        "Object",
        "Clothing",
        "Product",
        "Sport",
        "Electronic"
    ]
    
    var body: some View {
        
        
        VStack {

            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 10),
                GridItem(.flexible(), spacing: 10),
                GridItem(.flexible(), spacing: 10)
            ], spacing: 10) {
                ForEach(fruits, id: \.self) { fruit in
                    Button {
                        selectedFruits = fruit
                    } label: {
                        Text(fruit)
                            .font(.system(size: 16, design: .serif)).bold()
                            .foregroundStyle(fruit == selectedFruits ? Color.color1 : Color.colorText)
                            .bold()
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(selectedFruits == fruit ? Color.color4 : Color.color4.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}


#Preview {
    SelectedFruitsView(selectedFruits: .constant("Food"))
}
