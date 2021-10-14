//
//  TipCalculatorViewController.swift
//  TipCalculatorf2021
//
//  Created by Sujit Molleti on 9/29/21.
//

import UIKit

class TipCalculatorViewController: UIViewController {

    let tipPercentData: [Double] = [0.10, 0.15, 0.20, 0.25]
    var tipPercent: Double = 0.10
    
    //MARK: - Variables
    //MARK: - IB Outlets
    
    @IBOutlet weak var billTotalLabel: UILabel!
    @IBOutlet weak var tipTotalLabel: UILabel!
    
    @IBOutlet weak var tipSegmentControl: UISegmentedControl!
    @IBOutlet weak var amountTextField: UITextField!
    
    
    //MARK: - IB Actions
    
    @IBAction func didTapCalculateButton(_ sender: Any) {
        print("Calculate Button Tapped!")
        
        if amountTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            print("invalid entry for amount text field")
            return
        }
        
        let billString = amountTextField.text!
        
        guard let billAmount = Double(billString) else { return }
        
        let tipAmount = billAmount * tipPercent
        let amountTotal = billAmount + tipAmount
        
        tipTotalLabel.text = String(format: "$%.2f", tipAmount)
        billTotalLabel.text = String(format: "$%.2f", amountTotal)
        
        view.endEditing(true)
        
    }
    
    
    @IBAction func didTapSegmentControl(_ sender: Any) {
        
        tipPercent = tipPercentData[tipSegmentControl.selectedSegmentIndex]
        
    }
    
    
    // MARK: - View LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    
    
}



/* what do we want to do when the user taps "CALCULATE" ???  */
/* 1. Validate the entry in the bill amount text field. */
/* 2. Calculate the amount total and tip total using the data we receive from the segment control */
/* 3. Display our totals in their corresponding labels */
/* 4. dismissing the keyboard for our own sanity */


/* what do we want to do when the user taps the segment control ??? */
/* 1. Using the selected index we recieve from the segment control we will get the data from our array using the index and get the corresponding value */
/*
  -- Note that our array looks like this: [0.10, 0.15, 0.20, 0.25]
  -- And our segment control looks like:  [10% | 15% | 20% | 25%]

  -- if the user taps the 15% percent for example, our selected segment index
      will be equal to 1.

  -- now that we have the selected segment index, we can use it to retrieve our data from the array at the index 1.

  -- we can now set this data value equal to our tip percent variable which defaulted to 0.10

  -- this sounds like alot but we can do it in one line! This is the magic of the UI segment control and arrays.

*/
