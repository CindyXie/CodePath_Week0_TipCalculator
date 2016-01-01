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
    @IBOutlet weak var splitField: UITextField!
    @IBOutlet weak var splittedLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var separatorView: UIView!
    
    @IBOutlet weak var containerView1: UIView!
    @IBOutlet weak var containerView2: UIView!
    @IBOutlet var superView: UIView!
    
    let tipPercentage = TipPercentage()
    let backgroundColorSetting = BackgroundColorSetting()
    var tip = 0.00
    var total = 0.00
    var splitted = 0.00
    let currencyFormat = NSNumberFormatter()
    let defaults : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var originalContainerView1Center: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        originalContainerView1Center = containerView1.center
        containerView1.center = superView.convertPoint(superView.center, fromView: superView)
        containerView1.alpha = 1
        containerView2.alpha = 0
        
     
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splittedLabel.text = String(format: "$%.2f", splitted)
        
        let lastTime = defaults.objectForKey("lastTime")
        let now = NSDate.timeIntervalSinceReferenceDate()
        
        if lastTime != nil {
            let difference = now - (lastTime as! Double)
            if difference < 60 * 10 {
                let billValue = defaults.objectForKey("billValue")
                let numPeople = defaults.objectForKey("numPeople")
                if billValue != nil {
                    billField.text = String(billValue!)
                    splitField.text = String(numPeople!)
                }
                
            }
        }

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        tipControl.selectedSegmentIndex = tipPercentage.index
        updateTips()
        billField.becomeFirstResponder()
        
        let foregroundColor: UIColor
        if backgroundColorSetting.isNight {
            view.backgroundColor = UIColor.blackColor()
            foregroundColor = UIColor.whiteColor()
        } else {
            view.backgroundColor = UIColor.whiteColor()
            foregroundColor = UIColor.blackColor()
        }
        
        separatorView.backgroundColor = foregroundColor
        for containerView in view.subviews {
            for subview in containerView.subviews {
                if let label = subview as? UILabel {
                    label.textColor = foregroundColor
                }
            }
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        if billField.text != "" {
            defaults.setDouble(Double(billField.text!)!,forKey: "billValue")
        }else{
            defaults.setDouble(0.0,forKey: "billValue")
        }
        
        if splitField.text != "" {
            defaults.setDouble(Double(splitField.text!)!,forKey: "numPeople")
        }else{
            defaults.setDouble(1.0,forKey: "numPeople")
        }
        defaults.setDouble(NSDate.timeIntervalSinceReferenceDate(),forKey: "lastTime")
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTips()
        UIView.animateWithDuration(0.4, animations: {
            self.containerView1.center = self.originalContainerView1Center
            self.containerView1.alpha = 1
            self.containerView2.alpha = 1
            
        })
        
        if billField.text == "" {
            UIView.animateWithDuration(0.4, animations: {
                self.containerView1.center = self.superView.convertPoint(self.superView.center, fromView: self.superView)
                self.containerView1.alpha = 1
                self.containerView2.alpha = 0
                
            })
        }

    }
    
    func updateTips() {
        let text = (billField.text ?? "") as NSString
        let num = (splitField.text ?? "") as NSString
        let billAmount = text.doubleValue
        let numPeople = num.doubleValue
        let index = tipControl.selectedSegmentIndex
        tip = billAmount * tipPercentage.tipPercentageAtIndex(index)
        total = billAmount + tip
        if(numPeople == 0)
        {
            splitted = total / 1
        }
        else
        {
            splitted = total / numPeople
        }
        
        currencyFormat.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormat.locale = NSLocale.currentLocale()

        tipLabel.text = currencyFormat.stringFromNumber(tip)
        totalLabel.text = currencyFormat.stringFromNumber(total)
        splittedLabel.text = currencyFormat.stringFromNumber(splitted)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}



