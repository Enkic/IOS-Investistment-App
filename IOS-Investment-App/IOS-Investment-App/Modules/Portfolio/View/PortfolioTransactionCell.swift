//
//  PortfolioTransactionCell.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 21/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import UIKit

class PortfolioTransactionCell: UICollectionViewCell {
    
    @IBOutlet weak var profitsLabel: UILabel!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var coinImage: UIImageView!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.systemGray.cgColor
    }
}
