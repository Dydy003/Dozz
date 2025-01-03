//
//  MainView.swift
//  Dozz
//
//  Created by Dylan Caetano on 17/11/2024.
//

import SwiftUI
import CoreData 

struct MainView: View {
    
    @State private var selectedTabs: Tabs = .list
    @State private var showNewTaskItem = false
    @State private var animationTask = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            switch selectedTabs {
            case .list:
                 ZStack {
                    HomeView()
                        .sheet(isPresented: $showNewTaskItem) {
                            ZStack {
                                Color.gradient.ignoresSafeArea()
                                
                                NewTaskView(isShowing: $showNewTaskItem)
                                    .presentationDetents([.height(450)])
                             }
                        }
                }
            case .settings:
                SettingsView()
            }
            
            Divider()
                .frame(height: 2.2)
                .overlay(Color.colorText)
                .shadow(radius: 10)

             ZStack {
                CustomTabBarView(selectedTabs: $selectedTabs)
                ButtonPlusView(showNewTaskItem: $showNewTaskItem)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    MainView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
