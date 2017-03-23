//
//  ViewController.swift
//  TipCalculator
//
//  Created by Rupert Waldron on 11/03/2017.
//  Copyright © 2017 Rupert Waldron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var radiusSliderLbl: UILabel!
    @IBOutlet weak var radiusLbl: UILabel!
    @IBOutlet weak var straightLbl: UILabel!
    @IBOutlet weak var straightSliderLbl: UILabel!
    @IBOutlet weak var distanceLbl: UILabel!
    @IBOutlet weak var straightSlider: UISlider!
    
    
    // create an instance of TrackModel
    var myTrack = Trackmodel(radius: 0.0, straight: 0.0)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTrackCalculationValues ()
        updateUI()
    }

    func updateUI() {
        radiusLbl.text = String(format: "%0.2fM", myTrack.radius)
        straightLbl.text = String(format: "%0.2fM", myTrack.straight)
        radiusSliderLbl.text = "Radius: \(Int(radiusSlider.value)) M"
        straightSliderLbl.text = "Straight: \(Int(round(straightSlider.value))) M"
        //splitNumberLbl.text = "\(Int(paySplitSlider.value)) Way Split"
        distanceLbl.text = String(format: "%0.2fM", myTrack.totalDistance)
    }

    func setTrackCalculationValues () {
        myTrack.radius = Double(radiusSlider.value)
        myTrack.straight = Double(round(straightSlider.value))
        myTrack.calculateDistance()
    }

    
    
    @IBAction func radiusDidChange(_ sender: UISlider) {
        /*let steps: Float = 100
        let roundedValue = round(sender.value * steps) / steps
        sender.value = roundedValue*/
        print(radiusSlider.value)
        //(round(testSlider.value))
        setTrackCalculationValues ()
        updateUI()
    }
    
    @IBAction func straightDidChange(_ sender: Any) {
        print(round(straightSlider.value))
        setTrackCalculationValues ()
        updateUI()
    }
    
    
}

