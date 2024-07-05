//
//  NewTaskView.swift
//  Dozz
//
//  Created by Dylan Caetano on 05/07/2024.
//

import SwiftUI

struct NewTaskView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var task: String = ""
    @State private var fruits: String = ""
    
    private var isButtonDisabled: Bool {
        task.isEmpty /*|| fruits.isEmpty*/
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Task(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.fruits = fruits
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            hideKeuboard()
        }
    }
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New Task", text: $task)
                    .foregroundStyle(Color.colorText)
                    .bold()
                    .font(.system(size: 24, design: .serif))
                    .padding()
                    .background(
                        Color.color3.opacity(0.5)
                    )
                    .clipShape(.capsule)
                
                Button {
                    addItem()
                } label: {
                    
                    Spacer()
                    
                    Text("Save")
                        .foregroundStyle(Color.colorText)
                        .font(.system(size: 24, design: .serif))
                        .bold()
                    
                    Spacer()
                    
                }
                .disabled(isButtonDisabled)
                .padding()
                .font(.headline)
                .foregroundStyle(Color.colorText)
                .background(isButtonDisabled ? Color.color3.opacity(0.5) : Color.color1)
                .clipShape(.capsule)

            }
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(Color.gradient.opacity(0.5))
            .clipShape(.buttonBorder)
            .shadow(color: .colorText.opacity(0.3), radius: 5)
        }
        .padding()
    }
}

#Preview {
    NewTaskView()
        .background(Color.gradient.opacity(0.3).ignoresSafeArea())
}
