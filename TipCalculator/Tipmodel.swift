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
    // write the customer intialiser
    init(billAmount: Double, tipPercent: Double) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
    }
    
    //create function to calculate the tip
    func calculateTip() {
        _tipAmount = billAmount * tipPercent
        _totalAmount = billAmount + tipAmount
    }
}
