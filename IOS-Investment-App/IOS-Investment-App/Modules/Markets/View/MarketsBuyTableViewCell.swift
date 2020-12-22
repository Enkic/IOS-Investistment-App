//
//  MarketsBuyTableViewCell.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 17/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import Foundation
import UIKit

class MarketsBuyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cryptoIcon: UIImageView!
    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var cryptoValue: UILabel!
    
    var coinId: String!
}
