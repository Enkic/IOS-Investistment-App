//
//  String.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 27/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import Foundation

extension String {
    
    static func formatToDollar<T>(price: T) -> String {
        var NSNumberPrice: NSNumber
        if let price = price as? Float {
            NSNumberPrice = price as NSNumber
        } else if let price = price as? Int {
            NSNumberPrice = price as NSNumber
        } else if let price = price as? String {
            if let IntPrice = Int(price) {
                NSNumberPrice = IntPrice as NSNumber
            } else {
                
                return ""
            }
        } else {
            
            return ""
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let str = formatter.string(from: NSNumberPrice)

        return str ?? NSNumberPrice.stringValue
    }
    
}
