//
//  BackgroundColorSetting.swift
//  TipCalculator
//
//  Created by Xinxin Xie on 12/31/15.
//  Copyright © 2015 Xinxin Xie. All rights reserved.
//

import UIKit

class BackgroundColorSetting {
    
    var isNight: Bool {
        get {
            let defaults = NSUserDefaults.standardUserDefaults()
            return defaults.boolForKey("isNight")
        }
        set(newValue) {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setBool(newValue, forKey: "isNight")
            defaults.synchronize()
        }
    }
    
}
