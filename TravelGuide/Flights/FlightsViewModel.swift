//
//  FlightsViewModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 4.10.2022.
//

import Foundation

class FlightsViewModel {
    
    var model = FlightsModel()
    var modelResponse : Flights = []
  
    
    
    var numberOfItems : Int {
        self.modelResponse.count
    }
    
    func flightsItem(at index: Int) -> FlightElement {
        return self.modelResponse[index]
    }
    
    func getMainData() {
        model.getData()
        self.modelResponse = model.flightsPost!
    }
    
    
}
