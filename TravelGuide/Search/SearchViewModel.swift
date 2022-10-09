//
//  SearchViewModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 5.10.2022.
//

import Foundation


class SearchViewModel {
    
    var modelHotels = HotelsModel()
    var modelHotelsResponse : [Hotels] = []
    var modelFlights = FlightsModel()
    var modelFlightsResponse : Flights = []
    
    var numberOfHotelItems : Int {
        self.modelHotelsResponse.count
    }
    var numberOfFlightItems : Int {
        self.modelFlightsResponse.count
    }
    
    
    func hotelsItem(at index: Int) -> Hotels {
        return self.modelHotelsResponse[index]
    }
    
    func getHotelData() {
        modelHotels.getData()
        self.modelHotelsResponse = modelHotels.hotelsPost!
    }
    
    
    func flightsItem(at index: Int) -> Flight {
        return self.modelFlightsResponse[index]
    }
    
    func getFlightData() {
        modelFlights.getData()
        self.modelFlightsResponse = modelFlights.flightsPost!
    }
    
}
