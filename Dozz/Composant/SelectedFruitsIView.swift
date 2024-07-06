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
        "🍏",
        "🍎",
        "🍐",
        "🍊",
        "🍋",
        "🍋‍🟩",
        "🍌",
        "🍉",
        "🍇",
        "🍓",
        "🫐",
        "🍈",
        "🍒",
        "🍑",
        "🥭",
        "🍍",
        "🥥",
        "🥝",
        "🍅",
        "🍆",
        "🥑",
        "🫛",
        "🥦",
        "🥬",
        "🥔",
        "🍠",
        "🫚",
        "🥐",
        "🥯",
        "🍞",
        "🥖",
        "🥨",
        "🧀",
        "🥚",
        "🧈",
        "🥞",
        "🧇",
        "🥓",
        "🥩",
        "🍗",
        "🍖",
        "🌭",
        "🍔",
        "🍟",
        "🍕",
        "🫓",
        "🥪",
        "🥙",
        "🧆",
        "🥗",
        "🫕",
        "🍙",
        "🍣",
        "🍤",
        "🍪",
        "🍫",
        "🥤",
        "🍬",
        "🍦"
    ]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: -20) {
               Text("Îcone")
                .foregroundStyle(Color.colorText)
                   .font(.title)
                   .bold()
                   .padding()
               
               ScrollView(.vertical, showsIndicators: false) {
                       LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 6)) {
                           ForEach(fruits, id: \.self) { fruit in
                               Button {
                                   selectedFruits = fruit
                               } label: {
                                   Circle()
                                       .stroke(style: StrokeStyle(lineWidth: 4))
                                       .foregroundStyle(fruit == selectedFruits ? .text : .color2)
                                       .frame(width: 35, height: 35)
                                       .overlay {
                                           Text(fruit)
                                               .font(.title3)
                                       }
                               }
                           }
                       }
                       .padding(.vertical)
                       .padding(.horizontal)
                   
               }
               .padding(10.0)
        }
        .padding()
        .background( Color.color3.opacity(0.5))
        .frame(width: .infinity, height: 160)
        .clipShape(.buttonBorder)
    }
}

#Preview {
    @State var isSelect = "🍏"
    return SelectedFruitsView(selectedFruits: $isSelect)
}
