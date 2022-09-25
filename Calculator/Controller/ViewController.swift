//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
        
    private var isFinishedTypping: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Can not assign that value to a number.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypping = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
//            guard let result = calculator.Calculate(symbol: calcMethod) else {
//                fatalError("The result of the calculation is nil.")
//            }
            
            if let result = calculator.Calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isFinishedTypping {
                displayLabel.text = numValue
                isFinishedTypping = false
            } else {
                
                if numValue == "." && displayLabel.text!.contains(".") {
                    return
                }
                
                displayLabel.text! += numValue
            }
        }
        
    }
    
}

