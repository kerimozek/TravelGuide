//
//  MainModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 3.10.2022.
//

import Foundation

protocol MainModelProtocol: AnyObject {
    func didDataFetchProcessFinish(isSuccess: Bool)
}

class MainModel {
    
    
    var topPickData: [topPick]? = []
    weak var delegate: MainModelProtocol?
    
    func getData() {
        let path = Bundle.main.path(forResource: "topPickData", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(sampleTopPick.self, from: data)
            topPickData = result.topPickList
            delegate?.didDataFetchProcessFinish(isSuccess: true)
        }
        catch {
            delegate?.didDataFetchProcessFinish(isSuccess: false)
            print(error.localizedDescription)
        }
    }
}
