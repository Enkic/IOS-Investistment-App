//
//  SellCoinInteractor.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 21/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import Foundation
import Coinpaprika

class SellCoinsInteractor {
    
    let iconesUrl = "https://cryptoicons.org/api/icon/"
    let iconeSizeUrl = "/32"
    
}

extension SellCoinsInteractor: SellCoinsInteractorInterface {
    
    func getCryptoIcon(cryptoSymbol: String) -> Data? {

        let url = iconesUrl + cryptoSymbol.lowercased() + iconeSizeUrl
        guard let urlEncoded = URL(string: url) else { return nil }
        guard let imageData = try? Data(contentsOf: urlEncoded) else { return nil }
        
        return imageData
    }

    func getCoinBoughtInfosFromApi(for coinId: String, storeCoin: @escaping (CoinBoughtEntity) -> Void) {
        var coinBought = Storage.getBoughtCoin(with: coinId)
        
        guard coinBought != nil else { return }
        
        Coinpaprika.API.ticker(id: coinId, quotes: [.usd]).perform { (response) in
            switch response {
              case .success(let ticker):
                let coinAmountValue = Float(truncating: (Decimal(coinBought!.usdAmount)) / ticker[.usd].price as NSNumber)
                let coinDiff = coinAmountValue - coinBought!.amount
                let coinDiffUsd = coinDiff * Float(truncating: 1 / ticker[.usd].price as NSNumber)
                
                coinBought?.symbol = ticker.symbol
                coinBought?.profits = coinDiffUsd

                
                storeCoin(coinBought!)
                case .failure(_):
                break
            }
        }
    }
    
    func getCoinOhlcvFromApi(for coinId: String, from date: Date, storeCoinOhlvc: @escaping (CoinStocksEntity) -> Void) {
        Coinpaprika.API.coinHistoricalOhlcv(id: coinId, start: date, limit: 366, quote: .usd).perform { (response) in
            switch response {
              case .success(let ohlcv):
                storeCoinOhlvc(CoinStocksEntity(ticker: nil, ohlcv: ohlcv))
            case .failure(_):
                break
            }
        }
    }
    
    func getCoinInfosFromApi(for coinId: String, storeCoin: @escaping (CoinStocksEntity) -> Void) {
        Coinpaprika.API.ticker(id: coinId, quotes: [.usd]).perform { (response) in
            switch response {
              case .success(let ticker):
                storeCoin(CoinStocksEntity(ticker: ticker, ohlcv: nil))
            case .failure(_):
                break
            }
        }
    }
    
    func sellCoin(coinId: String, usdAmount: Int) -> Bool {

        return Storage.sellCoin(coinId: coinId, usdAmount: usdAmount)
    }
    
}
