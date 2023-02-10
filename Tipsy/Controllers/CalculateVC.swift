//
//  ViewController.swift
//  Tipsy
//
//  Created by Артём Голынец on 5.02.23.
//

import UIKit

class CalculateVC: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    private var tipsyBrain : TipsyBrain?
    
    var tip = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        tip = (Double(sender.titleLabel?.text?.dropLast() ?? "0.0") ?? 0.0) / 100
    }
    
    @IBAction func steppedValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.f",sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let sum = Double(billTextField.text ?? "0.0") ?? 0.0
        let numberOfPeople = Double(splitNumberLabel.text ?? "0") ?? 0
        tipsyBrain = TipsyBrain(sum: sum, tip: tip, numberOfPeople: numberOfPeople)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let vc = segue.destination as! ResultsVC
            vc.modalPresentationStyle = .fullScreen
            vc.total = tipsyBrain?.getTotal() ?? ""
            vc.settings = tipsyBrain?.getSettings() ?? ""
        }
    }
    
}

