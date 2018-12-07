//
//  ViewController.swift
//  TipCalculator
//
//  Created by Rupert Waldron on 11/03/2017.
//  Copyright © 2017 Rupert Waldron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
        }
    }
    
    @IBOutlet weak var trackPicker: UIPickerView!
    @IBOutlet weak var selectTrackLbl: UILabel!
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var radiusSliderLbl: UILabel!
    @IBOutlet weak var radiusLbl: UILabel!
    @IBOutlet weak var straightLbl: UILabel!
    @IBOutlet weak var straightSliderLbl: UILabel!
    @IBOutlet weak var distanceLbl: UILabel!
    @IBOutlet weak var straightSlider: UISlider!
    
    let trackType = ["200M", "300M", "400M", "Variable"]
    
    // create an instance of TrackModel
    var myTrack: Trackmodel!

    override func viewDidLoad() {
        super.viewDidLoad()
        trackPicker.dataSource = self
        trackPicker.delegate = self
        myTrack = Track200M()
        radiusSlider.setValue(Float(myTrack.radius), animated: true)
        straightSlider.setValue(Float(myTrack.straight), animated: true)
        updateUI()
    }

    func updateUI() {
        radiusLbl.text = String(format: "%0.2fM", myTrack.radius)
        straightLbl.text = String(format: "%0.2fM", myTrack.straight)
        radiusSliderLbl.text = "Radius: \(Int(round(radiusSlider.value))) M"
        straightSliderLbl.text = "Straight: \(Int(round(straightSlider.value))) M"
        distanceLbl.text = String(format: "%0.2fM", myTrack.totalDistance)
    }

    @IBAction func radiusDidChange(_ sender: UISlider) {
        if myTrack is TrackVariable {
            myTrack.radius = Double(round(radiusSlider.value))
            myTrack.straight = Double(round(straightSlider.value))
            myTrack.calculateDistance()
            distanceLbl.text = String(format: "%0.2fM", myTrack.totalDistance)
        } else {
            myTrack.radius = Double(round(radiusSlider.value))
            myTrack.calculateStraight()
            straightSlider.setValue(Float(myTrack.straight), animated: true)
        }
        updateUI()
    }
    
    @IBAction func straightDidChange(_ sender: Any) {
        print(round(straightSlider.value))
        
        if myTrack is TrackVariable {
            myTrack.radius = Double(round(radiusSlider.value))
            myTrack.straight = Double(round(straightSlider.value))
            myTrack.calculateDistance()
            distanceLbl.text = String(format: "%0.2fM", myTrack.totalDistance)
        } else {
            myTrack.straight = Double(round(straightSlider.value))
            myTrack.calculateRadius()
            radiusSlider.setValue(Float(myTrack.radius), animated: true)
        }
        updateUI()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return trackType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return trackType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var attributedString: NSAttributedString!
        attributedString = NSAttributedString(string: trackType[row], attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        return attributedString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch trackType[row] {
            case "200M":
                myTrack = Track200M()
                //setInitial200Values()
                print("200m selected")
                break
            case "300M":
                myTrack = Track300M()
                //setInitial300Values()
                print("300m selected")
                break
            case "400M":
                myTrack = Track400M()
                //setInitial400Values()
                print("400m selected")
                break
            case "Variable":
                myTrack = TrackVariable()
                print("Variable selected")
                break
            default:
                myTrack = TrackVariable()
                print("Default selected")
        }
        radiusSlider.setValue(Float(myTrack.radius), animated: true)
        straightSlider.setValue(Float(myTrack.straight), animated: true)
        updateUI()
        selectTrackLbl.text = "Track Distance = \(trackType[row])"
    }
    
}

