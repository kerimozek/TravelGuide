//
//  BooksmarksViewModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 6.10.2022.
//

import Foundation



class BookmarksViewModel {
    
    var model = BookmarksModel()
    var modelResponse : [Bookmarks] = []
 
    func bookmarksItem() {
        self.modelResponse = model.posts
    }
    
    func didViewLoad() {
        model.getData()
    }
    

}


