//
//  FlightsModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 4.10.2022.
//

import Foundation

class FlightsModel {

    var flightsPost: Flights? = []

    func getData() {
        let path = Bundle.main.path(forResource: "flights", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let result = try? JSONDecoder().decode(Flights.self, from: data)
            flightsPost = result
        }
        catch {
            print(error.localizedDescription)
        }
    }



}
