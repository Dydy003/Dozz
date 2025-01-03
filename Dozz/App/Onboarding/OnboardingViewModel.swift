//
//  OnboardingViewModel.swift
//  Dozz
//
//  Created by Dylan Caetano on 17/11/2024.
//

import SwiftUI

class OnboardingViewModel: ObservableObject {
    
    @Published var items: [OnboardingItem] = []
    
    init() {
        loadOnboardingData()
    }
    
    private func loadOnboardingData() {
        if let url = Bundle.main.url(forResource: "OnboardingJson", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let loadedItems = try? decoder.decode([OnboardingItem].self, from: data) {
                items = loadedItems
            }
        }
    }
}

