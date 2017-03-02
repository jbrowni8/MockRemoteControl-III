//
//  ViewController.swift
//  SimpleRemote
//
//  Created by James Browning on 1/30/17.
//  Copyright © 2017 James Browning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var power: UILabel!
    @IBOutlet weak var vol: UILabel!
    @IBOutlet weak var chan: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var chanReceived : Int = 0
    
    var fav : String = ""
    
    var digits : String = ""
    var counter = 0
    

    @IBAction func powerOn(_ sender: UISwitch) {
        power.text = (sender.isOn ? "On" : "Off")
        var enabled : Bool = false
        if power.text=="On" {
            enabled = true
            slider.isEnabled = enabled
            segmentControl.isEnabled = enabled
            chan.text = "\(000)"
        } else {
            slider.isEnabled = enabled
            segmentControl.isEnabled = enabled
            vol.text = "\(0)"
            chan.text = "Off"
        }
    }
    
    
    @IBAction func deltaVol(_ sender: UISlider) {
        if power.text=="On" {
            vol.text = "\(Int(sender.value))"
        }
    }
    
    @IBAction func chanChange(_ sender: UIButton) {
        if power.text=="On"{
            if let text = sender.titleLabel?.text {
                if let currentChan = Int(chan.text!) {
                    if text == "Ch+" && currentChan < 999{
                        chan.text = "\(currentChan+1)"
                    } else if text == "Ch-" && currentChan > 0 {
                        chan.text = "\(currentChan-1)"
                    }
                }
            }
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if power.text == "On"{
            if let digit = sender.titleLabel?.text {
                counter += 1
                digits.append(digit)
            }
            if counter == 3 {
                chan.text = "\(digits)"
                digits = ""
                counter = 0
            }
        }
    }
    
    @IBAction func favChan(_ sender: UISegmentedControl) {
        if power.text == "On" {
            if let fav: String = sender.titleForSegment(
                at: sender.selectedSegmentIndex) {
                chan.text = fav
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        fav = channelTextToSend
        chanReceived = channelToSend
        
        print (fav)
        print (chanReceived)
        
        if fav != "" {
            segmentControl.insertSegment(withTitle: fav.uppercased(), at: chanReceived-1, animated: false)
            segmentControl.removeSegment(at: chanReceived, animated: true)
        }
        
        //segmentControl.removeSegment(at: chanReceived-1, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

