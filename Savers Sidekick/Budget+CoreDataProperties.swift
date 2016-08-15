//
//  Budget+CoreDataProperties.swift
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

extension Budget {

    @NSManaged var totalFunds: NSNumber?
    @NSManaged var totalExpenses: NSNumber?
    @NSManaged var numberOfCategories: NSNumber?
    @NSManaged var name: String?
    @NSManaged var mostRecentExpense: NSDate?
    @NSManaged var categories: NSSet?

}
