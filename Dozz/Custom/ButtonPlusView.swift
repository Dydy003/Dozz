//
//  ButtonPlusView.swift
//  Dozz
//
//  Created by Dylan Caetano on 18/11/2024.
//

import SwiftUI

struct ButtonPlusView: View {
    
    @Binding var showNewTaskItem: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                showNewTaskItem.toggle()
            }
        }) {
            ZStack {
                Circle()
                    .stroke(Color.colorText, lineWidth: 6.0)
                    .frame(width: 40, height: 40)
                    .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                
                Image(systemName: showNewTaskItem ? "minus" : "plus")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundStyle(Color.colorText)
            }
            .padding(.bottom, 10)
        }
    }
}

#Preview {
    ButtonPlusView(showNewTaskItem: .constant(false))
}
