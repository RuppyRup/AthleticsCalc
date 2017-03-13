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
    var paySplitSlider: Int = 4
    @IBOutlet weak var splitNumberLbl: UILabel!
    @IBOutlet weak var youPayLbl: UILabel!
    
    @IBOutlet weak var testSlider: UISlider!
    // create an instance of tipModel
    var tip = Tipmodel(billAmount: 0.0, tipPercent: 0.0, numberOfDinners: 1)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCalculationValues ()
        updateUI()
    }

    func updateUI() {
        tipLbl.text = String(format: "£%0.2f", tip.tipAmount)
        totalLbl.text = String(format: "£%0.2f", tip.totalAmount)
        tipPercentageLbl.text = "Tip: \(Int(tipPercentageSlider.value * 100)) %"
        splitNumberLbl.text = "\(Int(round(testSlider.value))) Way Split"
        //splitNumberLbl.text = "\(Int(paySplitSlider.value)) Way Split"
        youPayLbl.text = String(format: "£%0.2f", tip.splitAmount)
    }

    func setTipCalculationValues () {
        tip.tipPercent = Double(tipPercentageSlider.value)
        tip.billAmount = ((textField.text)! as NSString).doubleValue
        tip.numberOfDinners = Int(round(testSlider.value))
        tip.calculateTip()
        tip.calculateSplit()
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
        //(round(testSlider.value))
        setTipCalculationValues ()
        updateUI()
    }
    
    @IBAction func splitSliderDidChange(_ sender: Any) {
        //print(tipPercentageSlider.value)
        print(round(testSlider.value))
        setTipCalculationValues ()
        updateUI()
    }
    
}

