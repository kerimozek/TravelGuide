//
//  HotelsEntity.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 5.10.2022.
//

import Foundation

struct Hotels: Codable {
    
    var id: String
    var name: String
    var detail: String
    var image: String
}

struct ListHotel: Codable {
    
    var ListHotels: [Hotels]
}

