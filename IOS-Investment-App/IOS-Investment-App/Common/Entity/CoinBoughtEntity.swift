//
//  CoinBoughtEntity.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 20/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import Foundation

struct CoinBoughtEntity: Codable {
    let id: String
    let amount: Float
    let usdAmount: Int
    let boughtPrice: Float
    var symbol: String?
    var profits: Float?
}
