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
    var myTrack = Trackmodel(radius: 0.0, straight: 0.0, track: Distance.variable, totalDistance: 0.0)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        trackPicker.dataSource = self
        trackPicker.delegate = self
        
        switch myTrack.track {
        case Distance.t200M:
            setInitial200Values()
            break
        case Distance.t300M:
            setInitial300Values()
            break
        case Distance.t400M:
            setInitial400Values()
            break
        default:
            setTrackCalculationValues ()
            updateUI()
        }
        
    }

    func updateUI() {
        radiusLbl.text = String(format: "%0.2fM", myTrack.radius)
        straightLbl.text = String(format: "%0.2fM", myTrack.straight)
        radiusSliderLbl.text = "Radius: \(Int(round(radiusSlider.value))) M"
        straightSliderLbl.text = "Straight: \(Int(round(straightSlider.value))) M"
        distanceLbl.text = String(format: "%0.2fM", myTrack.totalDistance)
    }

    func setInitial200Values () {
        myTrack.radius = 23.67
        myTrack.straight = 25.01
        myTrack.totalDistance = 200.0
        radiusSlider.setValue(Float(myTrack.radius), animated: true)
        straightSlider.setValue(Float(myTrack.straight), animated: true)
    }
    
    func setInitial300Values () {
        myTrack.radius = 34.80
        myTrack.straight = 40.04
        myTrack.totalDistance = 300.0
        radiusSlider.setValue(Float(myTrack.radius), animated: true)
        straightSlider.setValue(Float(myTrack.straight), animated: true)
    }
    
    func setInitial400Values () {
        myTrack.radius = 36.50
        myTrack.straight = 84.39
        myTrack.totalDistance = 400.0
        radiusSlider.setValue(Float(myTrack.radius), animated: true)
        straightSlider.setValue(Float(myTrack.straight), animated: true)
    }
    
    func setTrackCalculationValues () {
        myTrack.radius = Double(round(radiusSlider.value))
        myTrack.straight = Double(round(straightSlider.value))
        myTrack.calculateDistance()
    }

    
    @IBAction func radiusDidChange(_ sender: UISlider) {
        //print(radiusSlider.value)
        //(round(testSlider.value))
        //setTrackCalculationValues ()
        if myTrack.track != Distance.variable {
            myTrack.radius = Double(round(radiusSlider.value))
            myTrack.calculateStraight()
            straightSlider.setValue(Float(myTrack.straight), animated: true)
        } else {
            setTrackCalculationValues ()
        }
        updateUI()
    }
    
    @IBAction func straightDidChange(_ sender: Any) {
        print(round(straightSlider.value))
        
        if myTrack.track != Distance.variable {
            myTrack.straight = Double(round(straightSlider.value))
            radiusSlider.setValue(Float(myTrack.radius), animated: true)
            myTrack.calculateRadius()
        } else {
            setTrackCalculationValues ()
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
                myTrack.track = Distance.t200M
                setInitial200Values()
                print("200m selected")
                break
            case "300M":
                myTrack.track = Distance.t300M
                setInitial300Values()
                print("300m selected")
                break
            case "400M":
                myTrack.track = Distance.t400M
                setInitial400Values()
                print("400m selected")
                break
            case "Variable":
                myTrack.track = Distance.variable
                print("Variable selected")
                break
            default:
                myTrack.track = Distance.variable
                print("Default selected")
        }
        updateUI()
        selectTrackLbl.text = "Track Distance = \(trackType[row])"
    }
    
}

