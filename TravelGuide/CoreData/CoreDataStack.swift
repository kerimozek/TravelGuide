//
//  CoreDataStack.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 6.10.2022.
//

import Foundation
import CoreData

class CoreDataStack {
    
    
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    // Defining Container
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { _, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
        }
        return container
    }()
    
    // Defining Context
    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext
    
    // Function to Save Context
    func saveContext() {
        guard managedContext.hasChanges else {
            return
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}



