//
//  ViewController.swift
//  TipCalculator
//
//  Created by Rupert Waldron on 11/03/2017.
//  Copyright © 2017 Rupert Waldron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipPercentageLbl: UILabel!
    @IBOutlet weak var tipLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    
    // create an instance of tipModel
    var tip = Tipmodel(billAmount: 0.0, tipPercent: 0.0)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCalculationValues ()
        updateUI()
    }

    func updateUI() {
        tipLbl.text = String(format: "£%0.2f", tip.tipAmount)
        totalLbl.text = String(format: "£%0.2f", tip.totalAmount)
        tipPercentageLbl.text = "Tip: \(Int(tipPercentageSlider.value * 100)) %"
    }

    func setTipCalculationValues () {
        tip.tipPercent = Double(tipPercentageSlider.value)
        tip.billAmount = ((textField.text)! as NSString).doubleValue
        tip.calculateTip()
    }

    
    @IBAction func billAmountDidChange(_ sender: Any) {
        setTipCalculationValues ()
        updateUI()
    }
    
    @IBAction func tipPercentDidChange(_ sender: UISlider) {
        let steps: Float = 100
        let roundedValue = round(sender.value * steps) / steps
        sender.value = roundedValue
        print(tipPercentageSlider.value)
        setTipCalculationValues ()
        updateUI()
    }
}

