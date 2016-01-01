//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Xinxin Xie on 12/6/15.
//  Copyright © 2015 Xinxin Xie. All rights reserved./

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var colorThemeControl: UISegmentedControl!
    
    let tipPercentage = TipPercentage()
    let backgroundColorSetting = BackgroundColorSetting()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //print("view will appear")
        tipControl.selectedSegmentIndex = tipPercentage.index
        
        if backgroundColorSetting.isNight {
            colorThemeControl.selectedSegmentIndex = 1
        } else {
            colorThemeControl.selectedSegmentIndex = 0
        }
    }
    
    @IBAction func tipControlValueChanged(sender: AnyObject) {
        tipPercentage.index = tipControl.selectedSegmentIndex
        
    }

    @IBAction func colorThemeControlValueChanged(sender: AnyObject) {
        if colorThemeControl.selectedSegmentIndex == 0 {
            backgroundColorSetting.isNight = false
        } else {
            backgroundColorSetting.isNight = true
        }
    }
}
