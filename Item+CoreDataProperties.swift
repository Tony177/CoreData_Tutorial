//
//  Item+CoreDataProperties.swift
//  CoreData_Tutorial
//
//  Created by Antonio Avolio on 29/11/22.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var body: String
    @NSManaged public var id: UUID
    @NSManaged public var timestamp: Date
    @NSManaged public var title: String

}

extension Item : Identifiable {

}
