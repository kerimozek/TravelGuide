//
//  HotelsViewModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 5.10.2022.
//

import Foundation


class HotelsViewModel {
    
    var model = HotelsModel()
    var modelResponse : [Hotels] = []
    
    var numberOfItems : Int {
        self.modelResponse.count
    }
    
    func hotelsItem(at index: Int) -> Hotels {
        return self.modelResponse[index]
    }
    
    func getMainData() {
        model.getData()
        self.modelResponse = model.hotelsPost!
    }
    
}
