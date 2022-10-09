//
//  MainEntity.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 3.10.2022.
//

import Foundation


struct topPick: Decodable {
    
    var id: String
    var category: String
    var images: String
    var detail: String
    var title: String
    
    init(id: String, category: String, images: String, detail: String, title: String) {
        self.id = id
        self.category = category
        self.images = images
        self.detail = detail
        self.title = title
    }
    
}

struct sampleTopPick: Decodable {
    
    var topPickList: [topPick]
}


