//
//  HotelsViewModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 5.10.2022.
//

import Foundation


protocol HotelsViewModelViewProtocol: AnyObject {
    func didCellItemFetch(isSuccess: Bool)
}

class HotelsViewModel {
    
    var model = HotelsModel()
    var modelResponse : [Hotels] = []
    weak var viewDelegate: HotelsViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }
    
    var numberOfItems : Int {
        self.modelResponse.count
    }
    
    func hotelsItem(at index: Int) -> Hotels {
        return self.modelResponse[index]
    }
    
    func getMainData() {
        model.getData()
        self.modelResponse = model.hotelsPost!
    }
    
}

// MARK: - HotelsViewModelProtocol

extension HotelsViewModel: HotelsModelProtocol {
    
    func didDataFetchProcessFinish(isSuccess: Bool) {
        if isSuccess {
            viewDelegate?.didCellItemFetch(isSuccess: true)
        } else {
            viewDelegate?.didCellItemFetch(isSuccess: false)
        }
    }
}
