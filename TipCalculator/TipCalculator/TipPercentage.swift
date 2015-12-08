//
//  TipPercentage.swift
//  TipCalculator
//
//  Created by Xinxin Xie on 12/7/15.
//  Copyright © 2015 Xinxin Xie. All rights reserved.
//

import Foundation

class TipPercentage {
    
    let tipPercentages = [0.15, 0.18, 0.2]
    
    var tipPercentage: Double {
        get {
            let defaults = NSUserDefaults.standardUserDefaults()
            return defaults.doubleForKey("tip percentage")
        }
        set(newTipPercentage) {

            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setDouble(newTipPercentage, forKey: "tip percentage")
            defaults.synchronize()
        }
    }
    
    var index: Int {
        get {
            if let index = indexForTipPercentage(tipPercentage) {
                return index
            } else {
                return 0
            }
        }
        set(newIndex) {
            tipPercentage = tipPercentages[newIndex]
        }
    }
    
    func tipPercentageAtIndex(index: Int) -> Double {
        return tipPercentages[index]
    }
    
    func indexForTipPercentage(p: Double) -> Int? {
        for (index, percentage) in tipPercentages.enumerate() {
            if percentage == p {
                return index
            }
        }
        return nil
    }

}