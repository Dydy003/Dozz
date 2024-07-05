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
    
    @State private var showNewTaskItem = false
    @State private var animationTask = false
    @State private var task: String = ""
    
    
    // FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Task>
    
    // MARK - FUNCTION
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                Color.gradient.opacity(0.4).ignoresSafeArea()
                
                VStack {
                    
                    Spacer(minLength: 20)
                    
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
                                        .foregroundStyle(Color.colorText)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    
                                    Text("\(item.timestamp!, formatter: itemFormatter)")
                                        .foregroundStyle(Color.colorText)
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
                        Text("Dozz.")
                            .font(.title)
                            .foregroundStyle(Color.colorText)
                            .bold()
                    }
                }
                
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            
                            withAnimation {
                                showNewTaskItem.toggle()
                            }
                            
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(Color.colorText)
                                .bold()
                        }
                    }
                }
                
                if showNewTaskItem {
                    withAnimation {
                        NewTaskView()
                            .onAppear {
                                animationTask.toggle()
                            }
                            .transition(.scale)
                    }
                }
            }
            
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .topBarLeading) {
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
