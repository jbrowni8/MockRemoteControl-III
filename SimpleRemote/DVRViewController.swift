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
    @IBOutlet weak var goToRemote: UIBarButtonItem!
    
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
            goToRemote.isEnabled = enabled
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let text = sender.titleLabel {
            if text.text == "Stop" {
                state.text = "Stopped"
            } else if text.text == "Pause" {
                state.text = "Paused"
            } else {
                let conjunction = text.text! + "ing"
                state.text = conjunction
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
