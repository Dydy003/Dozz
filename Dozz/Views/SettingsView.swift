//
//  SettingsView.swift
//  Dozz
//
//  Created by Dylan Caetano on 17/11/2024.
//

import SwiftUI

struct SettingsView: View { 
    
    @State private var isDeleted = false
    @State private var isPinned = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("GENERAL") {
                    NavigationLink(destination: OnboardingView()) {
                        Label("Askip", systemImage: "questionmark")
                    }
                    NavigationLink(destination: PayWallRevenueCatView()) {
                        Label("Tip $0.99", systemImage: "dollarsign.arrow.circlepath")
                    }
                    NavigationLink(destination: InfosView()) {
                        Label("Infos", systemImage: "info")
                    }
                }
                .listRowBackground(Color.color4.opacity(0.1))
                
                Section("LINK") {
                    if !isDeleted {
                        Link(destination: URL(string: "https://www.instagram.com/dyd_s.code/profilecard/?igsh=Y29saDF1NnM5ZTNv")!) {
                            HStack {
                                Label("Instagram", systemImage: "i.square.fill")
                                
                                Spacer()
                                
                                Image(systemName: "link")
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        Link(destination: URL(string: "https://github.com/Dydy003")!) {
                            HStack {
                                Label("GitHub", systemImage: "cat.fill")
                                
                                Spacer()
                                
                                Image(systemName: "link")
                                    .foregroundColor(.secondary)
                            } 
                        }
                        
                        Link(destination: URL(string: "https://www.privacypolicies.com/live/ff4d1cdd-12ab-4c90-8388-21ebffa3e21f")!) {
                            HStack {
                                Label("Privacy Policie", systemImage: "person.and.background.striped.horizontal")
                                
                                Spacer()
                                
                                Image(systemName: "link")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .listRowBackground(Color.color4.opacity(0.1))
                
                Section("PARTAGE") {
                    ShareLink(item: URL(string: ";;.;.;..;.;.;.;.")!) {
                            Label("Partager", systemImage: "square.and.arrow.up.fill")
                    }
                }
                .listRowBackground(Color.color4.opacity(0.1))
                
            }
            .background(Color.gradient)
            .navigationTitle("Setting")
            .foregroundStyle(Color.color4)
            .scrollContentBackground(.hidden)
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundColor = UIColor(Color.color2)
                UINavigationBar.appearance().standardAppearance = appearance
                
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.color4)]
                appearance.titleTextAttributes = [.foregroundColor: UIColor(Color.color4)]
            }
        }
        .tint(Color.color4)
    }
}

#Preview {
    SettingsView()
}
