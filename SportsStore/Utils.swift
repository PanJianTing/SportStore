//
//  Utils.swift
//  SportsStore
//
//  Created by PanJianTing on 2017/12/2.
//  Copyright © 2017年 PanJianTing. All rights reserved.
//

import Foundation

class Utils {
    class func currencyStringFromNumber(number : Double) -> String{
        let formatter = NumberFormatter();
        formatter.numberStyle = .currency;
        return formatter.string(from: NSNumber(value:number)) ?? "";
        
    }
}
