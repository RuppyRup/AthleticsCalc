//
//  Trackmodel.swift
//  Athletics Track Calculator
//
//  Created by Rupert Waldron on 11/03/2017.
//  Copyright © 2017 Rupert Waldron. All rights reserved.
//

import Foundation

//enum Distance {
//    case t200M, t300M, t400M, variable
//}


class Trackmodel {
    // private variables can only be accessed by the class
    var radius: Double
    var straight: Double
    var totalDistance: Double!
    
    let π = Double.pi
    
    // write the customer intialiser
    init(radius: Double, straight: Double) {
        self.radius = radius
        self.straight = straight
    }
    
    
    //create function to calculate the total distance measured 20cm in
    func calculateDistance() {
        totalDistance = 2 * ((radius + 0.2) * π + straight)
    }

    func calculateRadius() {
        radius = ((totalDistance / 2) - straight) / π - 0.2
    }

    func calculateStraight() {
        straight = (totalDistance / 2) - π * (radius + 0.2)
    }
}

class Track200M: Trackmodel {
    init() {
        super.init(radius: 23.67, straight: 25.01)
        self.totalDistance = 200
    }
}

class Track300M: Trackmodel {
    init() {
        super.init(radius: 34.80, straight: 40.04)
        self.totalDistance = 300
    }
}

class Track400M: Trackmodel {
    init() {
        super.init(radius: 36.50, straight: 86.39)
        self.totalDistance = 400
    }
}

class TrackVariable: Trackmodel {
    init() {
        super.init(radius: 36.50, straight: 86.39)
        self.totalDistance = 400
    }
}
