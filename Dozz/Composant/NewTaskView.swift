//
//  NewTaskView.swift
//  Dozz
//
//  Created by Dylan Caetano on 05/07/2024.
//

   
import SwiftUI
import CoreData

struct NewTaskView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.dismiss) private var dismiss
    
    @State private var task: String = ""
    @State private var category: String = "Food"
    
    @Binding var isShowing: Bool
    
    @FocusState var isInputActive: Bool
    
    private var isButtonDisabled: Bool {
        task.isEmpty || category.isEmpty
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Task(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.category = category
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            category = "Food"
            hideKeuboard()
            isShowing = false
        }
    }
    
    var body: some View {
            NavigationView {
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Name :")
                            .font(.system(.title3, design: .serif))
                            .bold()
                            .foregroundStyle(Color.colorText)
                        
                        TextField(LocalizedStringKey("ex: Apple"), text: $task)
                            .foregroundStyle(Color.colorText)
                            .bold()
                            .font(.system(size: 18, design: .serif))
                            .padding(10)
                            .background(Color.color4.opacity(0.2))
                            .cornerRadius(10)
                            .focused($isInputActive)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    
                                    Spacer()
                                    
                                    Button {
                                        isInputActive = false
                                    } label: {
                                        ZStack {
                                            Text("Done")
                                                .font(.title3)
                                                .foregroundStyle(Color.color4)
                                                .bold()
                                        }
                                    }
                                }
                            }
                        
                        Text("Category :")
                            .foregroundStyle(Color.colorText)
                            .font(.system(.title3, design: .serif))
                            .bold()
                            .padding(.top)
                           
                        
                        SelectedFruitsView(selectedFruits: $category)
                    }
                    
                    Button(action: addItem) {
                        Text("Ajouter")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(task.isEmpty || category.isEmpty ? Color.color4.opacity(0.5) : Color.color4)
                            .foregroundStyle(Color.color1)
                            .bold()
                            .cornerRadius(8)
                    }
                    .padding()
                    .padding(.top, 20)
                    
                    Spacer()
                    
                        .padding()
                        .disabled(task.isEmpty || category.isEmpty)
                }
                .padding()
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("New List")
                            .font(.system(.title3, design: .serif))
                            .foregroundStyle(Color.color4)
                            .bold()
                    }
                }
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .foregroundStyle(Color.color4)
                                .bold()
                                .shadow(radius: 0.1)
                        }
                )
                .background(Color.gradient.ignoresSafeArea())
            }
    }
}

#Preview {
    NewTaskView(isShowing: .constant(true))
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
