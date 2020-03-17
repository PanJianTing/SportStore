//
//  Product.swift
//  SportsStore
//
//  Created by PanJianTing on 2017/12/2.
//  Copyright © 2017年 PanJianTing. All rights reserved.
//

import Foundation

class Product : NSObject, NSCopying {
    
    private(set) var name: String;
    private(set) var productDescription: String;
    private(set) var category: String;
    private var stockLevelBankingValue: Int = 0;
    private var priceBackingValue: Double = 0;
    
    
    init(name: String, description: String, category:String, price:Double, stockLevel: Int) {
        self.name = name;
        self.productDescription = description;
        self.category = category;
        
        super.init();
        
        self.price = price;
        self.stockLevel = stockLevel;
    }
    
    var stockLevel: Int{
        get {
            return stockLevelBankingValue;
        }
        set {
            stockLevelBankingValue = max(0, newValue);
        }
    }
    
    private(set) var price: Double{
        get {
            return priceBackingValue;
        }
        set {
            priceBackingValue = max(1, newValue);
        }
    }
    
    var stockValue: Double{
        get{
            return price * Double(stockLevel);
        }
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Product(name: self.name, description: self.productDescription, category: self.category, price: self.price, stockLevel: self.stockLevel)
    }
    
}
