//
//  SearchViewModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 5.10.2022.
//

import Foundation

protocol SearchViewModelViewProtocol: AnyObject {
    func didCellItemFetch(isSuccess: Bool)
}


class SearchViewModel {
    
    var modelHotels = HotelsModel()
    var modelHotelsResponse : [Hotels] = []
    var modelFlights = FlightsModel()
    var modelFlightsResponse : Flights = []
    var model = SearchModel()
    weak var viewDelegate: SearchViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }
    
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


// MARK: - SearchViewModelProtocol

extension SearchViewModel: SearchModelProtocol {
    
    func didDataFetchProcessFinish(isSuccess: Bool) {
        if isSuccess {
            viewDelegate?.didCellItemFetch(isSuccess: true)
        } else {
            viewDelegate?.didCellItemFetch(isSuccess: false)
        }
    }
}
