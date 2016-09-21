//
//  ExpenseTableViewCell.swift
//  Savers Sidekick
//
//  Created by Alex Wasserman on 8/28/16.
//  Copyright © 2016 Alex Wasserman. All rights reserved.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {

    @IBOutlet weak var expenseName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var expenseDescription: UILabel!
    
    var expense: Expense? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        expenseName?.text = nil
        date?.text = nil
        cost?.text = nil
        expenseDescription?.text = nil
        
        if let expense = self.expense {
            expenseName?.text = expense.name!
            
            cost?.text = "$\(expense.cost!)"
            
            expenseDescription?.text = expense.expenseDescription!
            
            if let validDate = expense.date {
                let formatter = DateFormatter()
                if Date().timeIntervalSince(validDate as Date) > 24*60*60 {
                    formatter.dateStyle = DateFormatter.Style.short
                }
                else {
                    formatter.timeStyle = DateFormatter.Style.short
                }
                date?.text = "\(formatter.string(from: validDate as Date))"
            }
            else {
                date?.text = nil
            }
        }
    }

}
