//
//  PayWallRevenueCatView.swift
//  Dozz
//
//  Created by Dylan Caetano on 21/11/2024.
//

import SwiftUI

struct PayWallRevenueCatView: View {
    
    @State private var isPawall = true
    @State private var showPaywall = false
    
    var body: some View {
        ZStack {
            Color.gradient.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 30) {
                    
                    if #available(iOS 17.0, *) {
                        Text("Bienvenue Sur Offrirez Un Pourboire À ")
                            .font(.system(size: 30.0, design: .serif))
                            .fontWeight(.semibold)
                        
                        + Text("Dozz.")
                            .font(.system(.title2, design: .serif))
                            .foregroundStyle(Color.color4)
                            .bold()
                    } else {
                        Text("Bienvenue Pour Offrir Un Pourboire A ")
                            .font(.system(size: 30.0, design: .serif))
                            .foregroundColor(Color.colorText)
                            .bold()
                        + Text("Dozz.")
                            .font(.title)
                            .foregroundColor(Color.color4)
                            .bold()
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 40) {
                        PayWallItemView(payWallItemModel: PayWallModel(
                            img: "face.dashed.fill",
                            title: "Un Grand Merci",
                            description: "Merci d'avoir téléchargé mon app, votre soutien compte beaucoup !"))
                        
                        PayWallItemView(payWallItemModel: PayWallModel(
                            img: "dollarsign.arrow.circlepath",
                            title: "Pourboire",
                            description: "Envie de m’encourager ? Offrez-moi un petit pourboire, ça booste\nma créativité !"))
                        
                        PayWallItemView(payWallItemModel: PayWallModel(
                            img: "heart.circle.fill",
                            title: "Motivation",
                            description: "Votre aide me motive à continuer de créer des applis utiles et sympas."))
                    }
                    .padding(.top, 50)
                    
                    
                    Spacer()
                    
                    if #available(iOS 17.0, *) {
                        if isPawall == false {
                            Button {
                                showPaywall = true
                            } label: {
                                Text("Valider")
                                    .foregroundStyle(Color.color1)
                                    .font(.system(size: 20, design: .serif))
                                    .bold()
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.color4)
                                    .clipShape(.buttonBorder)
                                    .shadow(radius: 4)
                            }
                        }
                        
                    } else {
                        if isPawall == false {
                            Button {
                                showPaywall = true
                            } label: {
                                Text("Valider")
                                    .foregroundStyle(Color.color1)
                                    .font(.system(size: 20, design: .serif))
                                    .bold()
                                    .background(Color.color4)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .cornerRadius(15)
                            .shadow(radius: 4)
                            
                        }
                    }
                }
                .padding()
                .sheet(isPresented: $showPaywall, content: {
                    
                })
            }
        }
    }
}


#Preview {
    PayWallRevenueCatView()
}
