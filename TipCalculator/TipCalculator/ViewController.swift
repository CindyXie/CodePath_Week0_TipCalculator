//
//  ViewController.swift
//  TipCalculator
//
//  Created by Xinxin Xie on 12/5/15.
//  Copyright © 2015 Xinxin Xie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let tipPercentage = TipPercentage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTips()
    }
    
    func updateTips() {
        let text = (billField.text ?? "") as NSString
        let billAmount = text.doubleValue
        let index = tipControl.selectedSegmentIndex
        let tip = billAmount * tipPercentage.tipPercentageAtIndex(index)
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //print("view will appear")
        tipControl.selectedSegmentIndex = tipPercentage.index
        updateTips()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
       //print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        //print("view did disappear")
    }
}



