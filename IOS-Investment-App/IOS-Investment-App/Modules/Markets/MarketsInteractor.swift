//
//  MarketsInteractor.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 01/12/2020.
//  Copyright (c) 2020 enki corbin. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import UIKit
import Coinpaprika
import Alamofire

final class MarketsInteractor {
    
    var presenter: MarketsPresenterInterface!

    let iconApi = IconAPI()

    var coins: [CoinEntity]!
    
    func castCoinsToCoinsEntity(coins: [Ticker], maxRange: Int) -> [CoinEntity] {
        var coinsCopy: [CoinEntity] = []
        
        for (i, coin) in coins.enumerated() {
            guard i < maxRange else { return coinsCopy }
            
            coinsCopy.append(CoinEntity())
            coinsCopy[i].name = coin.name
            coinsCopy[i].symbol = coin.symbol
            coinsCopy[i].usdPrice = Float(truncating: coin[.usd].price as NSNumber)
//            coinsCopy[i].iconData = getCryptoIcon(cryptoName: coin.symbol)
            coinsCopy[i].id = coin.id
        }
                
        return coinsCopy
    }
    
}

// MARK: - Extensions -

extension MarketsInteractor: MarketsInteractorInterface {
    
    func getCryptoIcon(coinSymbol: String) -> UIImage? {
        
        return iconApi.getIcon(withSymbolName: coinSymbol)
    }
    
    func fetchBoughtCoins(storeCoins: @escaping ([CoinBoughtEntity]) -> Void) {
        var coinsBought = Storage.getBoughtCoins()
        
        if coinsBought.count == 0 {
            storeCoins(coinsBought)
        }
                
        for i in 0..<coinsBought.count {
            Coinpaprika.API.ticker(id: coinsBought[i].id, quotes: [.usd]).perform { (response) in
                switch response {
                  case .success(let ticker):
                    let coinAmountValue = Float(truncating: (Decimal(coinsBought[i].usdAmount)) / ticker[.usd].price as NSNumber)
                    let coinDiff = coinAmountValue - coinsBought[i].amount
                    let coinDiffUsd = coinDiff * Float(truncating: 1 / ticker[.usd].price as NSNumber)
                    
                    coinsBought[i].symbol = ticker.symbol
                    coinsBought[i].profits = coinDiffUsd
                    
                    // Tmp update the view each time we get a new coin infos
                    storeCoins(coinsBought)
                    case .failure(_):
                    break
                }
            }
        }
    }
    
    func fetchCryptos(storeCoins: @escaping ([CoinEntity]) -> Void, maxRange: Int) {
        
        coins = []
        
        Coinpaprika.API.tickers(quotes: [.usd]).perform { (response) in
            switch (response) {
            case .success(let coinsResponse):
                let coinCasted = self.castCoinsToCoinsEntity(coins: coinsResponse, maxRange: maxRange)
                storeCoins(coinCasted)
            case .failure(let err):
                print("Api error:", err)
            }
        }
        
    }
}

