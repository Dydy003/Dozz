//
//  DozzApp.swift
//  Dozz
//
//  Created by Dylan Caetano on 26/06/2024.
//

import SwiftUI

@main
struct DozzApp: App {
    
    @AppStorage("Onboarding") private var Onboarding = false
    
    let persistenceController = PersistenceController.shared
    
//    init() {
//        Purchases.logLevel = .debug
//        Purchases.configure(withAPIKey: "")
//    }

    var body: some Scene {
        WindowGroup {
            if Onboarding {
                MainView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            } else {
                OnboardingView()
            }
        }
    }
}
