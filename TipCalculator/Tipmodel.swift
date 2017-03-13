//
//  Tipmodel.swift
//  TipCalculator
//
//  Created by Rupert Waldron on 11/03/2017.
//  Copyright © 2017 Rupert Waldron. All rights reserved.
//

import Foundation

class Tipmodel {
    // private variables can only be accessed by the class
    private var _billAmount: Double = 0
    private var _tipPercent: Double = 0
    private var _tipAmount: Double = 0
    private var _totalAmount: Double = 0
    private var _numberOfDinners: Int = 1
    private var _splitAmount: Double = 0
    
    // use getters and setters to access the private variables
    var billAmount: Double {
        get {
            return _billAmount
        } set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Double {
        get {
            return _tipPercent
        } set {
            _tipPercent = newValue
        }
    }
    
    var tipAmount: Double {
        get {
            return _tipAmount
        }
    }

    var totalAmount: Double {
        get {
            return _totalAmount
        }
    }
    
    var numberOfDinners: Int {
        get {
            return _numberOfDinners
        } set {
            _numberOfDinners = newValue
        }
    }
    
    var splitAmount: Double {
        get {
            return _splitAmount
        }
    }

    // write the customer intialiser
    init(billAmount: Double, tipPercent: Double, numberOfDinners: Int) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
        self._numberOfDinners = numberOfDinners
    }
    
    //create function to calculate the tip
    func calculateTip() {
        _tipAmount = billAmount * tipPercent
        _totalAmount = billAmount + tipAmount
    }
    
    //create function to calculate the split
    func calculateSplit() {
        if numberOfDinners > 0 {
            _splitAmount = totalAmount / Double(numberOfDinners)
        } else {
            _splitAmount = totalAmount
        }
    }
}
