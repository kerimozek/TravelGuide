//
//  SearchModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 5.10.2022.
//

import Foundation

protocol SearchModelProtocol: AnyObject {
    func didDataFetchProcessFinish(isSuccess: Bool)
}

class SearchModel {
    
    var hotelsPost: [Hotels]? = []
    var flightsPost: Flights? = []
    weak var delegate: SearchModelProtocol?
    
    func getHotelsData() {
        
        let path = Bundle.main.path(forResource: "hotels", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(ListHotel.self, from: data)
            hotelsPost?.removeAll()
            hotelsPost = result.ListHotels
            delegate?.didDataFetchProcessFinish(isSuccess: true)
        }
        catch {
            delegate?.didDataFetchProcessFinish(isSuccess: false)
            print(error.localizedDescription)
        }
    }
    
    
    func getFlightsData() {
        let path = Bundle.main.path(forResource: "flights", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let result = try? JSONDecoder().decode(Flights.self, from: data)
            flightsPost?.removeAll()
            flightsPost = result
            delegate?.didDataFetchProcessFinish(isSuccess: true)
        }
        catch {
            delegate?.didDataFetchProcessFinish(isSuccess: false)
            print(error.localizedDescription)
        }
    }
}
