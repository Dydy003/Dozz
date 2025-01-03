//
//  TextInfosView.swift
//  Dozz
//
//  Created by Dylan Caetano on 22/07/2024.
//

import SwiftUI

struct TextInfosView: View {
    
    let infos: infos
    
    var body: some View {
        VStack {
            HStack {
                Text(infos.title)
                    .font(.system(size: 15.5, design: .serif))
                
                Spacer()
                
                Text(infos.headline)
                    .font(.system(size: 15.5, design: .serif))
            }
            .foregroundStyle(Color.color4)
            
            Divider()
                .frame(height: 5.8)
                .overlay(Color.color4)
            
        }
        .padding()
        
    }
}

#Preview {
    TextInfosView(infos: infos(title: "Compatible", headline: "| iPhone |"))
}
