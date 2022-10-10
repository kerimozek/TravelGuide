//
//  FlightsViewModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 4.10.2022.
//

import Foundation

// PROTOCOL
protocol FlightsViewModelViewProtocol: AnyObject {
    func didCellItemFetch(isSuccess: Bool)
}

class FlightsViewModel {
    
    var model = FlightsModel()
    var modelResponse : Flights? = []
    weak var viewDelegate: FlightsViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }
    
    var numberOfItems : Int {
        print(modelResponse!.count)
        return self.modelResponse!.count
        
    }
    
    func flightsItem(at index: Int) -> Flight {
        return self.modelResponse![index]
    }
    
    func getMainData() {
        
        // MARK: - IF YOU WANT TO USE API PLEASE CHANGE FUNC -
        //  model.getDataAPI()
        model.getData()
    }
    
}

// MARK: - FlightsViewModelProtocol

extension FlightsViewModel: FlightsModelProtocol {
    
    func didDataFetchProcessFinish(isSuccess: Bool) {
        if isSuccess {
            self.modelResponse = model.flightsPost!
            viewDelegate?.didCellItemFetch(isSuccess: true)
        } else {
            viewDelegate?.didCellItemFetch(isSuccess: false)
        }
    }
}



