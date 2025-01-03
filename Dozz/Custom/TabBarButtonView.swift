//
//  TabBarButtonView.swift
//  Dozz
//
//  Created by Dylan Caetano on 17/11/2024.
//

import SwiftUI

struct TabBarButtonView: View {
    
    var buttonText: String
    var image: String
    var isActive: Bool
    
    var body: some View {
        GeometryReader { geo in
            
            if isActive {
                Rectangle()
                    .foregroundStyle(Color.color4)
                    .frame(width: geo.size.width/3, height: 6)
                    .padding(.leading, geo.size.width/3)
            }
            
            VStack(alignment: .center, spacing: 6.0) {
                
                Image(systemName: image)
                    .font(.system(size: 34.0))
                
                Text(buttonText)
                    .font(.system(size: 9.0, design: .serif))
                    .bold()
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

#Preview {
    TabBarButtonView(
        buttonText: "Liste",
        image: "checklist",
        isActive: false
    )
}
