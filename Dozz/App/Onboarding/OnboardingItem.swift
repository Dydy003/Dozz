//
//  OnboardingItem.swift
//  Dozz
//
//  Created by Dylan Caetano on 17/11/2024.
//

import Foundation

struct OnboardingItem: Identifiable, Codable {
    
    let id: Int
    let title: String
    let description: String
    let imageName: String
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.imageName = try container.decode(String.self, forKey: .imageName)
    }
}
