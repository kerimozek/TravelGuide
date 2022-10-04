//
//  MainEntity.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 3.10.2022.
//

import Foundation


struct topPick: Codable {
    
    let id: Int
    let category: String
    let images: String
    let description: String
    let title: String
}

struct sampleTopPick: Codable {
    
    let topPickList: [topPick]
}


