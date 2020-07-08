//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Carmen Lucas on 14/06/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    var totalBillPerson : String?
    var numberPeople : String?
    var tipPercent : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalBillPerson
        
        settingsLabel.text = "Split between \(numberPeople!) people, with \(tipPercent!)% tip."
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
