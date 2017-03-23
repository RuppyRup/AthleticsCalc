//
//  Trackmodel.swift
//  Athletics Track Calculator
//
//  Created by Rupert Waldron on 11/03/2017.
//  Copyright © 2017 Rupert Waldron. All rights reserved.
//

import Foundation

class Trackmodel {
    // private variables can only be accessed by the class
    private var _radius: Double = 0
    private var _straight: Double = 0
    private var _totalDistance: Double = 0
    
    let π = M_PI
    
    // use getters and setters to access the private variables
    var radius: Double {
        get {
            return _radius
        } set {
            _radius = newValue
        }
    }
    
    var straight: Double {
        get {
            return _straight
        } set {
            _straight = newValue
        }
    }
    
    var totalDistance: Double {
        get {
            return _totalDistance
        }
    }

        // write the customer intialiser
    init(radius: Double, straight: Double) {
        self._radius = radius
        self._straight = straight
    }
    
    //create function to calculate the tip
    func calculateDistance() {
        _totalDistance = 2 * (radius * π + straight)
    }
    
}
