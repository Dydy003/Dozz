//
//  PayWallItemView.swift
//  Dozz
//
//  Created by Dylan Caetano on 21/11/2024.
//

import SwiftUI

struct PayWallItemView: View {
    
    var payWallItemModel: PayWallModel
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: payWallItemModel.img)
                .font(.system(size: 50.0))
                .foregroundStyle(Color.color4)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(payWallItemModel.title)
                    .font(.title2).bold()
                    .foregroundStyle(Color.colorText)
                
                Text(payWallItemModel.description)
                    .font(.subheadline)
                    .foregroundStyle(Color.color4)
            }
        }
    }
}

#Preview {
    PayWallItemView(payWallItemModel: PayWallModel(
        img: "face.dashed.fill",
        title: "Un Grand Merci",
        description: "Merci d'avoir téléchargé mon app,\nvotre soutien compte beaucoup !"
    ))
}
