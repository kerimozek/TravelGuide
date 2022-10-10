//
//  BookmarksModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 6.10.2022.
//

import Foundation
import CoreData

protocol BookmarksModelProtocol: AnyObject {
    func didDataFetchProcessFinish(isSuccess: Bool)
}


class BookmarksModel {
    
   
    var posts: [Bookmarks] = []
    weak var delegate: BookmarksModelProtocol?

    func getData() {
        
        let fetchRequest: NSFetchRequest<Bookmarks> = Bookmarks.fetchRequest()
        let sortByDate = NSSortDescriptor(key: #keyPath(Bookmarks.date), ascending: false)
        fetchRequest.sortDescriptors = [sortByDate]
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try context.fetch(fetchRequest)
            posts = results
            delegate?.didDataFetchProcessFinish(isSuccess: true)
        } catch {
            delegate?.didDataFetchProcessFinish(isSuccess: false)
            print(error.localizedDescription)
        }
    }
}



