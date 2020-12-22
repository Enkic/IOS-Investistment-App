//
//  MarketsSellTableViewCell.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 20/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import Foundation
import UIKit

class MarketsSellTableViewCell: UITableViewCell {
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var coinProfitsAmountLabel: UILabel!
    
    var coinId: String!

}
