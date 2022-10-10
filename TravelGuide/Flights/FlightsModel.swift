//
//  FlightsModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 4.10.2022.
//

import Foundation
import Alamofire

// PROTOCOL
protocol FlightsModelProtocol: AnyObject {
    func didDataFetchProcessFinish(isSuccess: Bool)
}

class FlightsModel {

    var flightsPost: Flights? = []
    weak var delegate: FlightsModelProtocol?
    
    
    // MARK: - GET DATA WITH MOCK JSON -
    
    func getData() {
        let path = Bundle.main.path(forResource: "flights", ofType: "json")
        let url = URL(fileURLWithPath: path!)

        do {
            // DECODING DATA
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
    
    
    // MARK: - GET DATA WITH API -
    
    func getDataAPI() {

        let apiKey = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI0IiwianRpIjoiY2RkNDkyNzg3NThiZmExOGQ0NTIwMTAxODAwZmI3MDMyMTYzMTY4YzIzN2M0ZjgzZDMxOWMxZWVhNGY0NTU0ODdlNTdmODMyZWMwNmMwOGUiLCJpYXQiOjE2NjUxNjEwOTQsIm5iZiI6MTY2NTE2MTA5NCwiZXhwIjoxNjk2Njk3MDk0LCJzdWIiOiIxNDU2NCIsInNjb3BlcyI6W119.CJToYgMw3DrhL2HV1u_zYBuBvsITne05F1q_aT1MhEJFBBHosZlqf5NnfVat4aA3RBoduNCE-Uvg0VW-7mu9Hw"
        let departureIATAcode = "AYT"
        let arrivalIATAcode = "SAW"
        let requestURL = "https://app.goflightlabs.com/routes?access_key=\(apiKey)&dep_iata=\(departureIATAcode)&arr_iata=\(arrivalIATAcode)"
        // GET DATA FROM API
        AF.request(requestURL).response { response in

            do {
                guard let data = response.data else { return }
                // DECODING DATA
                let result = try JSONDecoder().decode(Flights.self, from: data)
                self.flightsPost?.removeAll()
                self.flightsPost = result
                self.delegate?.didDataFetchProcessFinish(isSuccess: true)
            } catch {
                self.delegate?.didDataFetchProcessFinish(isSuccess: false)
                print(error.localizedDescription)
            }
        }
    }
}
