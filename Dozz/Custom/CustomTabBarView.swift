//
//  CustomTabBarView.swift
//  Dozz
//
//  Created by Dylan Caetano on 15/11/2024.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Binding var selectedTabs: Tabs
    
    @State private var buttonPlus = false
    
    var body: some View {
        HStack(alignment: .center) {
            
            Button {
                
                selectedTabs = .list
                
            } label: {
                
                TabBarButtonView(buttonText: "List", image: "checklist", isActive: selectedTabs == .list)
                
            }
            .tint(Color.color4)
            
            
            Button {
                
                selectedTabs = .settings
                
            } label: {
                
                TabBarButtonView(buttonText: "Setting", image: "gear", isActive: selectedTabs == .settings)
                
            }
            .tint(Color.color4)
        }
        .frame(height: 80)
        .background(Color.gradient)
    }
}

#Preview {
    CustomTabBarView(selectedTabs: .constant(.list))
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}




//import SwiftUI
//
//struct CustomTabBarView: View {
//    
//    @Binding var showNewTaskItem: Bool
//    
//    var body: some View {
//      
//            
//            HStack {
                
//                Button(action: {
//                    withAnimation {
//                        showNewTaskItem.toggle()
//                    }
//                }) {
//                    ZStack {
//                        Circle()
//                            .stroke(Color.colorText, lineWidth: 3.0)
//                            .frame(width: 60, height: 60)
//                            .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4) // Shadow added
//                        
//                        Image(systemName: showNewTaskItem ? "minus.circle.fill" : "plus")
//                            .font(.system(size: 24, weight: .bold))
//                            .foregroundStyle(Color.colorText)
//                    }
//                }
//                
//            }
//            .frame(height: 90) // Adjusted for cleaner layout
//    }
//}
//
