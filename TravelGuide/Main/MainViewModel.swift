//
//  MainViewModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 3.10.2022.

import Foundation

// PROTOCOL
protocol MainViewModelViewProtocol: AnyObject {
    func didCellItemFetch(isSuccess: Bool)
}


class MainViewModel {
    
    var model = MainModel()
    var modelResponse : [topPick] = []
    weak var viewDelegate: MainViewModelViewProtocol?
    
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

// MARK: - MainViewModelProtocol

extension MainViewModel: MainModelProtocol {
    
    func didDataFetchProcessFinish(isSuccess: Bool) {
        if isSuccess {
            viewDelegate?.didCellItemFetch(isSuccess: true)
        } else {
            viewDelegate?.didCellItemFetch(isSuccess: false)
        }
    }
}

