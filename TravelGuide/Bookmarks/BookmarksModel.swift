//
//  BookmarksModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 6.10.2022.
//

import Foundation
import CoreData




class BookmarksModel {
    
   
    var posts: [Bookmarks] = []


    func getData() {
        
        let fetchRequest: NSFetchRequest<Bookmarks> = Bookmarks.fetchRequest()
        let sortByDate = NSSortDescriptor(key: #keyPath(Bookmarks.date), ascending: false)
        fetchRequest.sortDescriptors = [sortByDate]
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try context.fetch(fetchRequest)
            posts = results
            
        } catch {
            
            print(error.localizedDescription)
        }
    }
    
}



