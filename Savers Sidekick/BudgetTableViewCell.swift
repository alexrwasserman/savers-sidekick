//
//  BudgetTableViewCell.swift
//  Savers Sidekick
//
//  Created by Alex Wasserman on 8/15/16.
//  Copyright © 2016 Alex Wasserman. All rights reserved.
//

import UIKit

class BudgetTableViewCell: UITableViewCell {
    @IBOutlet weak var mostRecentEntry: UILabel!
    @IBOutlet weak var budgetName: UILabel!
    @IBOutlet weak var budgetStatus: UILabel!
    
    var budget: Budget? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        mostRecentEntry?.text = nil
        budgetName?.text = nil
        budgetStatus?.text = nil
        
        if let budget = self.budget {
            budgetName?.text = budget.name
            
            let funds = budget.totalFunds
            let expenses = budget.totalExpenses
            budgetStatus?.text = "$\(expenses)/$\(funds)"
            
            if let validDate = budget.mostRecentExpense {
                let formatter = NSDateFormatter()
                if NSDate().timeIntervalSinceDate(validDate) > 24*60*60 {
                    formatter.dateStyle = NSDateFormatterStyle.ShortStyle
                }
                else {
                    formatter.timeStyle = NSDateFormatterStyle.ShortStyle
                }
                mostRecentEntry?.text = "Most recent entry: \(formatter.stringFromDate(validDate))"
            }
            else {
                mostRecentEntry?.text = nil
            }
        }
    }
}
