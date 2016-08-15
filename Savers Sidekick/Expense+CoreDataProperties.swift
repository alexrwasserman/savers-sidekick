//
//  Expense+CoreDataProperties.swift
//  Savers Sidekick
//
//  Created by Alex Wasserman on 8/15/16.
//  Copyright © 2016 Alex Wasserman. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Expense {

    @NSManaged var name: String?
    @NSManaged var date: NSDate?
    @NSManaged var cost: NSNumber?
    @NSManaged var expenseDescription: String?
    @NSManaged var parentCategory: NSManagedObject?

}
