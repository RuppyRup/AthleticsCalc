//
//  Trackmodel.swift
//  Athletics Track Calculator
//
//  Created by Rupert Waldron on 11/03/2017.
//  Copyright © 2017 Rupert Waldron. All rights reserved.
//

import Foundation

enum Distance {
    case t200M, t300M, t400M, variable
}


class Trackmodel {
    // private variables can only be accessed by the class
    private var _radius: Double = 0
    private var _straight: Double = 0
    private var _totalDistance: Double = 0
    private var _track: Distance = Distance.variable
    
    let π = M_PI
    
    // use getters and setters to access the private variables
    var radius: Double {
        get {
            return _radius
        } set {
            _radius = newValue
        }
    }
    
    var track: Distance {
        get {
            return _track
        } set {
            _track = newValue
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
        } set {
            _totalDistance = newValue
        }
    }

        // write the customer intialiser
    init(radius: Double, straight: Double, track: Distance, totalDistance: Double) {
        self._radius = radius
        self._straight = straight
        self._track = track
    }
    
    //create function to calculate the total distance measured 20cm in
    func calculateDistance() {
        _totalDistance = 2 * ((radius + 0.2) * π + straight)
    }
    
    func calculateRadius() {
        _radius = ((totalDistance / 2) - straight) / π - 0.2
    }
    
    func calculateStraight() {
        _straight = (totalDistance / 2) - π * (radius + 0.2)
    }
}


