//
//  DVRViewController.swift
//  SimpleRemote
//
//  Created by James Browning on 2/22/17.
//  Copyright © 2017 James Browning. All rights reserved.
//

import UIKit

class DVRViewController: UIViewController {
    
    @IBOutlet weak var power: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var functionsViewController: UIView!
    
    @IBAction func dvrPower(_ sender: UISwitch) {
        power.text = (sender.isOn ? "On" : "Off")
        var enabled : Bool = false
        if power.text=="On" {
            enabled = true
            state.text = "Stopped"
            functionsViewController.isUserInteractionEnabled = enabled
        } else {
            enabled = false
            state.text = "Off"
            functionsViewController.isUserInteractionEnabled = enabled
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        var currentState : String = ""
        if state.text != nil {
            currentState = state.text!
        }
        if let text = sender.titleLabel?.text {
            if text == "Stop" {
                state.text = "Stopped"
            } else if currentState == "Stopped" && text == "Record" {
                state.text = "Recording"
            } else if currentState == "Stopped" && text == "Play"{
                state.text = "Playing"
            } else if text == "Pause" && (currentState == "Stopped"
                || currentState == "Playing") {
                state.text = "Pausing"
            } else if currentState == "Playing"{
                state.text = text + "ing"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backToRemote(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
