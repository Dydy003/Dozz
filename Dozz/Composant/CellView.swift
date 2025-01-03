//
//  CellView.swift
//  Dozz
//
//  Created by Dylan Caetano on 10/07/2024.
//

import SwiftUI
import CoreData


struct CellView: View {

    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var task: Task

    private func saveChanges() {
        guard viewContext.hasChanges else { return }
        
        viewContext.perform {
            do {
                try self.viewContext.save()
            } catch {
                print("Error saving changes: \(error.localizedDescription)")
            }
        }
    }

    var body: some View {
        HStack {
            // Toggle et texte principal
            Toggle(isOn: $task.completion) {
                Text(task.task ?? "")
                    .foregroundStyle(task.completion ? Color.colorText : Color.colorText)
                    .lineLimit(1)
                    .font(.system(size: 18.5, design: .serif))
                    .fontWeight(.bold)
            }
            .toggleStyle(CheckboxView())
            .strikethrough(task.completion)
            .padding(.leading, -10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(25)
        .background(
            // Fond principal de la cellule
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color.color5)
        )
        .background(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.color4, lineWidth: 5.3)
                .shadow(color: Color.color4.opacity(0.3), radius: 3)
        )
        
        .overlay(
            // "Aliment" positionné par-dessus grâce à overlay
            Text(task.category ?? "")
                .font(.system(size: 15, design: .serif))
                .bold()
                .foregroundStyle(Color.color1)
                .padding(.leading, 8)
                .padding(.trailing, 8)
                .padding(4)
                .background(Color.color4)
                .cornerRadius(.infinity)
                .frame(maxWidth: 110, alignment: .leading)
                .padding(.top, 8)
                .padding(.leading),
            alignment: .topTrailing
        )
        .padding(16.0)


    }
}


#Preview {
    let context = PersistenceController.preview.container.viewContext
      let task = Task(context: context)
  
      task.category = "Aliments"
      task.task = "Buy Bananas"
      task.completion = false
      task.timestamp = Date()
  
      return CellView(task: task)
          .environment(\.managedObjectContext, context)
}



//if #available(iOS 17.0, *) {
//    Text(task.task ?? "")
//        .foregroundStyle(task.completion ? Color.color1 : Color.colorText)
//        .lineLimit(1)
//        .font(.system(size: 18.5, design: .serif))
//        .fontWeight(.bold)
//        .onChange(of: task.completion) {
//            saveChanges()
//        }
//    
//} else {
//    // MARK: iOS 16
//    
//    VStack(alignment: .leading) {
//        Text(task.task ?? "")
//            .foregroundStyle(task.completion ? Color.color1 : Color.colorText)
//            .lineLimit(1)
//            .font(.system(size: 18.5, design: .serif))
//            .fontWeight(.bold)
//        
//    }
//    .onChange(of: task.completion) { newValue in
//        saveChanges()
//    }
//    .padding()
//}



//                        .onChange(of: task.completion) {
//                            saveChanges()
//             }
