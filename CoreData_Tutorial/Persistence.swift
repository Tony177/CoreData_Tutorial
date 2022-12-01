//
//  Persistence.swift
//  CoreData_Tutorial
//
//  Created by Antonio Avolio on 28/11/22.
//

import CoreData

class ViewModel : ObservableObject {
    let container = NSPersistentContainer(name:"CoreData_Tutorial")
    init(){
        container.loadPersistentStores{ description,error in
            if let error = error{
                print("Failed to load data \(error.localizedDescription)")
            }
        }
    }
    
    func saveDB(context: NSManagedObjectContext) -> Void{
        do{
            try context.save()
            print("Data saved")
        } catch{
            print("Can't save data")
        }
    }
}
