//
//  DetailsModel.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 4.10.2022.
//

import Foundation
import CoreData


class DetailsModel {
    
    var topPickData: topPick?
    
    func saveCoreData(topPickData: topPick) {

        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let data = Bookmarks(context: managedContext)

        data.setValue(Date(), forKey: #keyPath(Bookmarks.date))
        data.setValue(topPickData.title, forKey: #keyPath(Bookmarks.title))
        data.setValue(topPickData.detail, forKey: #keyPath(Bookmarks.detail))
        data.setValue(topPickData.category, forKey: #keyPath(Bookmarks.category))
        data.setValue(topPickData.images, forKey: #keyPath(Bookmarks.image))
        data.setValue(UUID(), forKey: "uuid")

        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
    }
    
    func deleteData(_ title: String) {
        
        let fetchRequest: NSFetchRequest<Bookmarks> = Bookmarks.fetchRequest()
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", title)
        
        fetchRequest.predicate = predicate
        
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let result = try context.fetch(fetchRequest).first
            
            if let result = result {
                context.delete(result)
                AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
