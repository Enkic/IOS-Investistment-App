//
//  TransactionEntity.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 21/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import UIKit

struct TransactionEntity: Codable {
    let coinId: String
    let usdProfits: Float
    let symbol: String
}
