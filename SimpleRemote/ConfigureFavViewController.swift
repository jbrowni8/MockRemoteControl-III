//
//  ConfigureFavViewController.swift
//  SimpleRemote
//
//  Created by James Browning on 2/27/17.
//  Copyright © 2017 James Browning. All rights reserved.
//

import UIKit

class ConfigureFavViewController: UIViewController {

    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var chanTF: UILabel!
    @IBOutlet weak var stepperVal: UIStepper!
    @IBOutlet weak var configChanTab: UITabBarItem!
    
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
