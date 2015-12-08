//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Xinxin Xie on 12/6/15.
//  Copyright © 2015 Xinxin Xie. All rights reserved./

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    let tipPercentage = TipPercentage()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //print("view will appear")
        tipControl.selectedSegmentIndex = tipPercentage.index
        
    }
    @IBAction func tipControlValueChanged(sender: AnyObject) {
        tipPercentage.index = tipControl.selectedSegmentIndex
        
    }

}
