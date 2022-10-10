//
//  HotelsModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 5.10.2022.
//

import Foundation

// PROTOCOL
protocol HotelsModelProtocol: AnyObject {
    func didDataFetchProcessFinish(isSuccess: Bool)
}

class HotelsModel {

    var hotelsPost: [Hotels]? = []
    weak var delegate: HotelsModelProtocol?
    
    // GET DATA
    func getData() {
        let path = Bundle.main.path(forResource: "hotels", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            // DECODING DATA
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
}
