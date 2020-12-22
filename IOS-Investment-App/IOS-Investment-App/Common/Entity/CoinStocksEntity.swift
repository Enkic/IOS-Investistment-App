//
//  CoinStocksEntity.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 19/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import Coinpaprika

struct CoinStocksEntity {
    let ticker: Ticker?
    let ohlcv: [Ohlcv]?
}
