//
//  AlerteView.swift
//  Dozz
//
//  Created by Dylan Caetano on 18/11/2024.
//

import SwiftUI

struct AlerteView: View {
    
    let title: String
    let message: String
    let confirmAction: () -> Void
    let cancelAction: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.title2)
                .foregroundStyle(Color.color4)
                .bold()
            
            if !message.isEmpty {
                Text(message)
                    .font(.headline)
                    .foregroundStyle(Color.color4.opacity(0.5))
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
            HStack {
                Button(action: cancelAction) {
                    if #available(iOS 17.0, *) {
                        Text("Cancel")
                            .foregroundStyle(Color.color1)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.color4.opacity(0.3))
                            .clipShape(.buttonBorder)
                    } else {
                        Text("Cancel")
                            .foregroundStyle(Color.color4)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.color4.opacity(0.3))
                            .cornerRadius(15)
                    }
                }
                Button(action: confirmAction) {
                    if #available(iOS 17.0, *) {
                        Text("Delete")
                            .foregroundStyle(Color.color1)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.color4.opacity(0.5))
                            .clipShape(.buttonBorder)
                    } else {
                        Text("Delete")
                            .foregroundStyle(Color.color1)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.color4.opacity(0.5))
                            .cornerRadius(15)
                    }
                }
            }
        }
        .padding()
        .padding(.leading, 5)
        .padding(.trailing, 5)
        .background(Color.color5)
        .shadow(radius: 0)
        .cornerRadius(10)
        .padding()
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    AlerteView(
        title: "Delete the list",
        message: "Are you sure you want to delete this list ?",
           confirmAction: {
               print("Action confirm")
           },
        cancelAction: {
            print("Action cancelled.")
        }
    )
}
