//
//  PayWallModel.swift
//  Dozz
//
//  Created by Dylan Caetano on 21/11/2024.
//

import Foundation

struct PayWallModel {
    
    let img: String
    let title: String
    let description: String
    
    init(img: String, title: String, description: String) {
        self.img = img
        self.title = title
        self.description = description
    }
}
