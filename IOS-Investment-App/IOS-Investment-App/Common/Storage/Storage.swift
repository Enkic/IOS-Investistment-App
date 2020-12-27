//
//  CoinStorage.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 20/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import Foundation
import UIKit

class Storage {
    
    private let defaults = UserDefaults.standard
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    private enum Keys: String {
        case walletAmount = "WalletAmount"
        case boughtCryptos = "BoughtCryptos"
        case transactions = "Transactions"
    }
    
    func addTransaction(coinId: String, usdProfits: Float, symbol: String, iconData: Data?) -> Bool {
        var transactions = getTransations()
        let transaction = TransactionEntity(coinId: coinId, usdProfits: usdProfits, symbol: symbol)
        
        transactions.append(transaction)
        
        if let transactionsEncoded = try? encoder.encode(transactions) {
            defaults.set(transactionsEncoded, forKey: Keys.transactions.rawValue)
            
            return true
        }
        
        return false
    }
    
    func getTransations() -> [TransactionEntity] {
        if let transactionsMapData = defaults.object(forKey: Keys.transactions.rawValue) as? Data {
            if let transactionsMap = try? decoder.decode([TransactionEntity].self, from: transactionsMapData) {
                
                return transactionsMap
            }
        }
        
        return []
    }
    
    func getBoughtCoins() -> [CoinBoughtEntity] {
        if let coinsBoughtMapData = defaults.object(forKey: Keys.boughtCryptos.rawValue) as? Data {
            if let coinsBoughtMap = try? decoder.decode([CoinBoughtEntity].self, from: coinsBoughtMapData) {
                
                return coinsBoughtMap
            }
        }
        
        return []
    }
    
    func getBoughtCoin(with id: String) -> CoinBoughtEntity? {
        if let coinsBoughtMapData = defaults.object(forKey: Keys.boughtCryptos.rawValue) as? Data {
            if let coinsBoughtMap = try? decoder.decode([CoinBoughtEntity].self, from: coinsBoughtMapData) {
                
                if coinsBoughtMap.contains(where: {$0.id == id}) {

                    return coinsBoughtMap.first(where: {$0.id == id})!
                }
            }
        }
        
        return nil
    }
    
    func sellCoin(coinId: String, usdAmount: Int) -> Bool {
        var coinsBoughtMap = getBoughtCoins()
        
        if coinsBoughtMap.contains(where: {$0.id == coinId}) {
            addMoneyToWallet(amount: usdAmount)
            coinsBoughtMap.removeAll(where: {$0.id == coinId})
            
            if let coinBoughtEncoded = try? encoder.encode(coinsBoughtMap) {
                defaults.set(coinBoughtEncoded, forKey: Keys.boughtCryptos.rawValue)
                
                return true
            }
        }
        
        return false
    }
    
    func buyCoin(coinId: String, coinAmount: Float, usdAmount: Int, boughtPrice: Float) -> Bool {
        guard substarctMoneyToWallet(amount: usdAmount) else { return false }
        
        var coinsBoughtMap = getBoughtCoins()
        var coinAmountToStore = coinAmount
        var usdAmountToStore = usdAmount
        var boughtPrice = boughtPrice

        if coinsBoughtMap.contains(where: {$0.id == coinId}) {
            coinAmountToStore += (coinsBoughtMap.first(where: {$0.id == coinId}))!.amount
            usdAmountToStore += (coinsBoughtMap.first(where: {$0.id == coinId}))!.usdAmount
            boughtPrice = (coinsBoughtMap.first(where: {$0.id == coinId}))!.boughtPrice
            coinsBoughtMap.removeAll(where: {$0.id == coinId})
        }
        
        let coinBought = CoinBoughtEntity(id: coinId, amount: coinAmountToStore, usdAmount: usdAmountToStore, boughtPrice: boughtPrice)
        coinsBoughtMap.append(coinBought)
        
        if let coinBoughtEncoded = try? encoder.encode(coinsBoughtMap) {
            defaults.set(coinBoughtEncoded, forKey: Keys.boughtCryptos.rawValue)
        } else {
        
            return false
        }
        
        return true
    }
    
    func getMoneyFromWallet() -> Int {
        
        return defaults.integer(forKey: Keys.walletAmount.rawValue)
    }
    
    func addMoneyToWallet(amount: Int) {
        var currentMoney = getMoneyFromWallet()
                
        currentMoney += amount
        defaults.set(currentMoney, forKey: Keys.walletAmount.rawValue)
    }
    
    func substarctMoneyToWallet(amount: Int) -> Bool {
        var currentMoney = getMoneyFromWallet()
        
        currentMoney -= amount
        if currentMoney < 0 {
        
            return false
        }
        defaults.set(currentMoney, forKey: Keys.walletAmount.rawValue)
        
        return true
    }
    
}
