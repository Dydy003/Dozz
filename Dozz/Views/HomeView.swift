//
//  HomeView.swift
//  Dozz
//
//  Created by Dylan Caetano on 26/06/2024.
//

import SwiftUI
import CoreData

struct HomeView: View {

    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.editMode) private var editMode

    @State private var isEditing = false
    @State private var showDeleteConfirmation = false
    @State private var searchText = ""
    @State private var showSearchBar = true
    @State private var previousScrollOffset: CGFloat = 0
    @State private var currentScrollOffset: CGFloat = 0

    @FetchRequest(
        entity: Task.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.timestamp, ascending: true)],
        animation: .default
    ) private var items: FetchedResults<Task>

    private var filteredItems: [Task] {
        if searchText.isEmpty {
            return Array(items)
        } else {
            return items.filter { $0.task?.localizedCaseInsensitiveContains(searchText) ?? false }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.gradient.ignoresSafeArea()

                VStack {
                    
                    Rectangle()
                        .frame(height: 2.2)
                        .foregroundStyle(Color.colorText)
                    
                    if showSearchBar {
                        HStack(spacing: 12) {
                            TextField("Search...", text: $searchText)
                                .padding(.leading)
                                .foregroundStyle(Color.color4)
                                .padding(8)
                                .overlay(
                                    HStack {
                                        Spacer()
                                        if !searchText.isEmpty {
                                            Button(action: { searchText = "" }) {
                                                Image(systemName: "xmark.circle.fill")
                                                    .foregroundStyle(Color.color4)
                                            }
                                            .padding(.trailing, 16)
                                        }
                                    }
                                )
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.color4, lineWidth: 3.3)
                                .shadow(color: Color.color4.opacity(0.3), radius: 3)
                        )
                        .padding(.horizontal)
                        .padding(.top)
                        .animation(.easeInOut, value: showSearchBar)
                    }

                    ScrollView {
                
                        VStack(spacing: -10) {
                            ForEach(filteredItems) { task in
                                HStack {
                                    CellView(task: task)
                                        .padding(1.4)
                                    if isEditing {
                                        Button {
                                            deleteTask(task)
                                        } label: {
                                            Image(systemName: "trash")
                                                .foregroundStyle(Color.colorText)
                                                .bold()
                                                .padding(.trailing)
                                        }
                                        .buttonStyle(BorderlessButtonStyle())
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Dozz")
                            .font(.system(size: 28.0, design: .serif))
                            .foregroundStyle(Color.colorText)
                            .bold()
                    }

                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            isEditing.toggle()
                        } label: {
                            Image(systemName: isEditing ? "minus.square.fill" : "pedal.brake.fill")
                                .font(.system(size: 24.0, design: .serif))
                                .foregroundStyle(Color.color4)
                                .bold()
                        }
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showDeleteConfirmation = true
                        } label: {
                            Image(systemName: "xmark.app.fill")
                                .font(.system(size: 24.0))
                                .foregroundStyle(Color.color4)
                                .bold()
                        }
                    }
                }

                if showDeleteConfirmation {
                    FontColorView()

                    AlerteView(
                        title: "Delete the list",
                        message: "Are you sure you want to delete this list ?",
                        confirmAction: {
                            deleteAllItems()
                            showDeleteConfirmation = false
                        },
                        cancelAction: {
                            showDeleteConfirmation = false
                        }
                    )
                    .transition(.opacity)
                    .zIndex(1)
                }
            }
        }
    }

    private func handleScroll() {
        if currentScrollOffset > previousScrollOffset && currentScrollOffset > 50 {
            withAnimation {
                showSearchBar = false
            }
        } else if currentScrollOffset < previousScrollOffset {
            withAnimation {
                showSearchBar = true
            }
        }
        previousScrollOffset = currentScrollOffset
    }

    private func deleteTask(_ task: Task) {
        withAnimation {
            viewContext.delete(task)
            saveContext()
        }
    }

    private func deleteAllItems() {
        withAnimation {
            items.forEach(viewContext.delete)
            saveContext()
        }
    }

    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

#Preview {
    HomeView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

