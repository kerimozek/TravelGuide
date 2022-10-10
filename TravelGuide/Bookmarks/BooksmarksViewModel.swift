//
//  BooksmarksViewModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 6.10.2022.
//

import Foundation

// PROTOCOL
protocol BookmarksViewModelViewProtocol: AnyObject {
    func didCellItemFetch(isSuccess: Bool)
}


class BookmarksViewModel {
    
    var model = BookmarksModel()
    var modelResponse : [Bookmarks] = []
    weak var viewDelegate: BookmarksViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }
 
    func bookmarksItem() {
        self.modelResponse = model.posts
    }
    
    func didViewLoad() {
        model.getData()
    }
}

// MARK: - BookmarksViewModelProtocol

extension BookmarksViewModel: BookmarksModelProtocol {
    
    func didDataFetchProcessFinish(isSuccess: Bool) {
        if isSuccess {
            viewDelegate?.didCellItemFetch(isSuccess: true)
        } else {
            viewDelegate?.didCellItemFetch(isSuccess: false)
        }
    }
}


