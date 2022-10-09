//
//  DetailsViewModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 4.10.2022.
//

import Foundation


class DetailsViewModel {
    
    var model = DetailsModel()

    
    func didSaveClicked(topPickData: topPick) {
        model.saveCoreData(topPickData: topPickData)
    }
    
    func didDeleteClicked(_ title: String) {
        model.deleteData(title)
    }
    

}

