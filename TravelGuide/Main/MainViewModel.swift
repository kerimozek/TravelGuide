//
//  MainViewModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 3.10.2022.

import Foundation


class MainViewModel {
    
    var model = MainModel()
    var modelResponse : [topPick] = []
  
    
    var numberOfItems : Int {
        self.modelResponse.count
    }
    
    func topPickItem(at index: Int) -> topPick {
        return self.modelResponse[index]
    }
    
    func getMainData() {
        model.getData()
        self.modelResponse = model.topPickData!
    }
    
}



