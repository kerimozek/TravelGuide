//
//  MainEntity.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 3.10.2022.
//

import Foundation


struct topPick: Codable {
    
    var id: String
    var category: String
    var images: String
    var description: String
    var title: String
}

struct sampleTopPick: Codable {
    
    var topPickList: [topPick]
}


