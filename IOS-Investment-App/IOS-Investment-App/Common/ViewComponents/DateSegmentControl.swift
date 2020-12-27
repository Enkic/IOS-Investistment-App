//
//  DateSegmentControl.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 27/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import UIKit

class DateSegmentControl: UISegmentedControl {
    
    func getSelectedDate() -> Date {
        var date: Date = Date(timeIntervalSince1970: 0)
        
        switch self.selectedSegmentIndex {
        case 0:
            date = (Calendar.current.date(byAdding: .hour, value: -1, to: Date())!)
        case 1:
            date = (Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date())
        case 2:
            date = (Calendar.current.date(byAdding: .weekday, value: -1, to: Date()) ?? Date())
        case 3:
            date = (Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date())
        default:
            break
        }
                
        return date
    }
    
}
