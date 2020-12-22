//
//  CoinBoughtEntity.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 20/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import Foundation

struct CoinBoughtEntity: Codable {
    var id: String
    var amount: Float
    var usdAmount: Int
    var symbol: String?
    var profits: Float?
    var iconData: Data?
}
