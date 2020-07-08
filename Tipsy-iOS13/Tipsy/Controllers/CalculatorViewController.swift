//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

   
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet weak var textFill: UITextField!
    
    var tipPercent = 0.0
    var numberPeople = 2
    var totalBill = 0.0
    var totalPerson = 0.0
    
 

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        if(sender.currentTitle == zeroPctButton.currentTitle){
            zeroPctButton.isSelected = true
            tipPercent = 0.0
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }else if (sender.currentTitle == tenPctButton.currentTitle){
               zeroPctButton.isSelected = false
            tipPercent = 0.1
                     tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            
        }else{
               zeroPctButton.isSelected = false
            tipPercent = 0.2
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            
            
        }
    }
    
 
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        if(Int(sender.value) > numberPeople){
            numberPeople += 1
            splitNumberLabel.text = String(numberPeople)
         
        }else{
            numberPeople -= 1
            splitNumberLabel.text = String (numberPeople)
            
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        totalBill = Double(billTextField.text ?? "0.0") ?? 0.0
        print(numberPeople)
        print(totalBill)
        totalPerson = (totalBill + totalBill * tipPercent) / Double(numberPeople)
        print("\(String(format: "%.2f" ,totalPerson))€ per person")
        switch tipPercent {
        case 0.0:
            print("0.0")
        case 0.1:
                       print("0.1")
        case 0.2:
                       print("0.2")
        default:
            break
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
           destinationVC.totalBillPerson = String(format: "%.2f" ,totalPerson)
            destinationVC.numberPeople = String( numberPeople)
            destinationVC.tipPercent = String(format: "%.0f" ,(tipPercent * 100))
        }
    }}

