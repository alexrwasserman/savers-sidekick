//
//  CreateNewCategoryViewController.swift
//  Savers Sidekick
//
//  Created by Alex Wasserman on 8/22/16.
//  Copyright © 2016 Alex Wasserman. All rights reserved.
//

import UIKit
import CoreData

class CreateNewCategoryViewController: UIViewController, UITextFieldDelegate {
    
    var context: NSManagedObjectContext?
    
    var currentBudget: Budget?

    @IBOutlet weak var enteredName: UITextField!
    @IBOutlet weak var enteredFunds: UITextField!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        validateInput(name: self.enteredName.text, funds: self.enteredFunds.text)
        
        if let name = self.enteredName.text, let funds = self.enteredFunds.text {
            context?.performAndWait {
                _ = Category.categoryWithInfo(
                    name: name,
                    totalFunds: Double(funds)!.roundToTwoDecimalPlaces(),
                    inBudget: self.currentBudget!,
                    inContext: self.context!
                )
                try? self.context!.save()
            }
            
            dismissView()
        }
    }
    
    @IBAction func dismissView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enteredName.delegate = self
        enteredFunds.delegate = self
    }
    
    
    // MARK: - TextField Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == enteredName) {
            enteredFunds.becomeFirstResponder()
        }
        else {
            enteredFunds.resignFirstResponder()
        }
        
        return true
    }
    
    
    // MARK: - Input validation
    
    fileprivate func validateInput(name: String?, funds: String?) {
        //TODO: implement this function, should trigger an alert to the user
        //      that they either left required fields blank or passed a value
        //      that doesn't parse to a valid number. Create an enum and pass
        //      it to this function to determine which kind of error it was
    }

}
