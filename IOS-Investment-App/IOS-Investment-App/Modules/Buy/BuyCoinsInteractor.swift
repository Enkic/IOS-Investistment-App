//
//  BuyCoinsInteractor.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 19/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import Foundation
import Coinpaprika

class BuyCoinsInteractor {

    var store = Storage()
    
}

extension BuyCoinsInteractor: BuyCoinsInteractorInterface {

    func getConvertionRateFromApi(for coinId: String, usdAmount: Int, convertionCallBack: @escaping (String, Int, Float, Float) -> Void) {
        Coinpaprika.API.ticker(id: coinId, quotes: [.usd]).perform { (response) in
            switch response {
              case .success(let ticker):
                let convertionRate = Float(truncating: 1 / ticker[.usd].price as NSNumber)
                let price = ticker[.usd].price
                convertionCallBack(coinId, usdAmount, convertionRate, Float(truncating: price as NSNumber))
            case .failure(_):
                break
            }
        }
    }
    
    func buyCoin(coinId: String, coinAmount: Float, usdAmount: Int, boughtPrice: Float) -> Bool {
        
        return store.buyCoin(coinId: coinId, coinAmount: coinAmount, usdAmount: usdAmount, boughtPrice: boughtPrice)
    }


    func getCoinInfosFromApi(for coinId: String, storeCoin: @escaping (Ticker) -> Void) {
        Coinpaprika.API.ticker(id: coinId, quotes: [.usd]).perform { (response) in
            switch response {
              case .success(let ticker):
                storeCoin(ticker)
            case .failure(_):
                break
            }
        }
    }
    
    func getCoinOhlcvFromApi(for coinId: String, from date: Date, storeCoinOhlvc:  @escaping ([Ohlcv]) -> Void) {
        
        Coinpaprika.API.coinHistoricalOhlcv(id: coinId, start: date, limit: 366, quote: .usd).perform { (response) in
            switch response {
              case .success(let ohlcv):
                storeCoinOhlvc(ohlcv)
            case .failure(_):
                break
            }
        }
        
    }
    
}
