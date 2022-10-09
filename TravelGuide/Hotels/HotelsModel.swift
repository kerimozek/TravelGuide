//
//  HotelsModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 5.10.2022.
//

import Foundation


class HotelsModel {
    
    
    var hotelsPost: [Hotels]? = []
    
    func getData() {
        let path = Bundle.main.path(forResource: "hotels", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(ListHotel.self, from: data)
            hotelsPost?.removeAll()
            hotelsPost = result.ListHotels
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    
}
