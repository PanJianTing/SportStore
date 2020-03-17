//
//  Logger.swift
//  SportsStore
//
//  Created by PanJianTing on 2017/12/9.
//  Copyright © 2017年 PanJianTing. All rights reserved.
//

import Foundation

//let productLogger = Logger<Product>(callback:{ p in
//    print("Change : \(p.name) \(p.stockLevel) items in stock");
//});


class Logger<T> where T:NSObject, T:NSCopying {
    var dataItems:[T] = [];
    var callback:(T) -> Void;
    var arrayQ = DispatchQueue(label: "arrayQ", qos: .userInteractive , attributes: .concurrent);
    var callbackQ = DispatchQueue(label: "callbackQ");
    
    private init(callback:@escaping (T) -> Void, protected:Bool = true) {
        self.callback = callback;
        if(protected){
            self.callback = { (item:T) in
                self.callbackQ.async {
                    callback(item);
                }
                
            }
        }
    }
    
    func logItem(item:T) {
        arrayQ.async {
            self.dataItems.append(item.copy() as! T);
            self.callback(item);
        }
    }
    
    func processItems(callback:(T) -> Void) {
        arrayQ.sync {
            for item in self.dataItems {
                callback(item);
            }
        }
    }
    
    class var proudctLogger: Logger<Product> {
        let singleton = Logger<Product>(callback : { p in
            print("Change : \(p.name) \(p.stockLevel) items in stock");
        });
        
        return singleton;
    }
}
