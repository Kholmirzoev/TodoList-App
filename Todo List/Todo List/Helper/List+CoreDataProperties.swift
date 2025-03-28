//
//  List+CoreDataProperties.swift
//  Todo List
//
//  Created by Ibrohim on 27/03/25.
//
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List")
    }

    @NSManaged public var title: String?

}

extension List : Identifiable {

}
