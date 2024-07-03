//
//  HomeView.swift
//  Dozz
//
//  Created by Dylan Caetano on 26/06/2024.
//

import SwiftUI
import CoreData

struct HomeView: View {
   // MARK: - PROPERTY
    
    @State private var task: String = ""
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    // FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Task>
    
    // MARK - FUNCTION
    private func addItem() {
        withAnimation {
            let newItem = Task(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
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
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gradient.ignoresSafeArea()
                
                VStack {
                        VStack(spacing: 16) {
                            TextField("New Task", text: $task)
                                .padding()
                                .background(
                                    Color.white.opacity(0.5)
                                )
                                .clipShape(.capsule)
                            
                            Button {
                                addItem()
                            } label: {
                                
                                Spacer()
                                
                                Text("Save")
                                
                                Spacer()
                                
                            }
                            .disabled(isButtonDisabled)
                            .padding()
                            .font(.headline)
                            .foregroundStyle(Color.colorText)
                            .background(isButtonDisabled ? Color.color1.opacity(0.5) : Color.color1)
                            .clipShape(.capsule)

                        }
                        .padding()
                    
                    
                    Divider()
                        .frame(height: 2.0)
                        .overlay(Color.colorText)
                        .padding()
                    
                        ScrollView {
                            ForEach(items) { item in
                                HStack {
                                    Image(systemName: "sun.min.fill")
                                        .font(.title)
                                        .scaledToFit()
                                        .foregroundStyle(Color.colorText)
                                        .bold()
                                        .padding()
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(item.task ?? "")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                        
                                        Text("\(item.timestamp!, formatter: itemFormatter)")
                                            .font(.footnote)
                                            .fontWeight(.light)
                                    }
                                    .padding()
                                }
                            }
                            .onDelete(perform: deleteItems)
                        }
                }
                .navigationBarTitleDisplayMode(.inline)
                
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Image(systemName: "sun.min.fill")
                                .foregroundStyle(Color.colorText)
                                .bold()
                                Text("Daily Tasks")
                                    .foregroundStyle(Color.colorText)
                                    .bold()
                                Image(systemName: "sun.min.fill")
                                    .foregroundStyle(Color.colorText)
                                    .bold()
                        }
                    }
                }
            }

            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                        .foregroundStyle(Color.colorText).bold()
                }
                #endif
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

// MARK: - PREVIEW
#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
