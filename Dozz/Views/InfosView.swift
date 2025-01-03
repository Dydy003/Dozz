//
//  InfosView.swift
//  Dozz
//
//  Created by Dylan Caetano on 20/11/2024.
//

import SwiftUI

struct InfosView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.gradient.ignoresSafeArea()
                
                VStack {
                    Image("DozzL")
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: geometry.size.width * 0.4, // 30% de la largeur de l'écran
                            height: geometry.size.width * 0.4
                        )
                        .padding(.top, geometry.size.height * 0.05)
                    
                
                    ScrollView {
                        VStack(spacing: 20) {
                            TextInfosView(infos: infos(title: "iOS_Developer :", headline: "| Dylan CAETANO |"))
                            TextInfosView(infos: infos(title: "Application :", headline: "| Dozz |"))
                            TextInfosView(infos: infos(title: "Version :", headline: "| 1.0 |"))
                            TextInfosView(infos: infos(title: "Compatible :", headline: "| iPhone, iOS16-18 |"))
                        }
                        .padding(.top, geometry.size.height * 0.1)
                        .padding()
                    }
                    
                    Spacer()
                }
               
            }
        }
    }
}

#Preview {
    InfosView()
}
