//
//  ConfigureFavViewController.swift
//  SimpleRemote
//
//  Created by James Browning on 2/27/17.
//  Copyright © 2017 James Browning. All rights reserved.
//

import UIKit

var channelToSend = Int()
var channelTextToSend = String()

class ConfigureFavViewController: UIViewController {

    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var chanTF: UILabel!
    @IBOutlet weak var stepperVal: UIStepper!
    
    @IBAction func descExit(_ sender: UITextField) {
        descriptionTextField.resignFirstResponder()
    }
    
    @IBAction func buttonSegControl(_ sender: UISegmentedControl) {
        if let seg: String = sender.titleForSegment(
            at: sender.selectedSegmentIndex) {
            chanTF.text = seg
            stepperVal.value = (Double(seg))!
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        descriptionTextField.text = ""
        chanTF.text = "1"
        stepperVal.value = 1.0
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        if descriptionTextField.text != nil {
           channelTextToSend = descriptionTextField.text!

        }
        
        if chanTF.text != nil {
            if let text = Int(chanTF.text!) {
                channelToSend  = text
            }
        }
        
        let alertController = UIAlertController(title: title,
                                                message: "You've chosen \(channelTextToSend) to be on channel \(channelToSend)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .destructive, handler: nil)
        let okayAction = UIAlertAction(title: "Confirm",
                                       style: .default) {
                                        _ in channelTextToSend = channelTextToSend
        }

        alertController.addAction(cancelAction)
        alertController.addAction(okayAction)
        present(alertController, animated: true, completion: nil)
        
        let chanName = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        chanName.fav = channelTextToSend
        navigationController?.pushViewController(chanName, animated: true)
        
        let chanNum = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        chanNum.chanReceived = channelToSend
        navigationController?.pushViewController(chanNum, animated: true)
        }
    
    
    @IBAction func chanClicker(_ sender: UIStepper) {
        chanTF.text = Int(sender.value).description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
