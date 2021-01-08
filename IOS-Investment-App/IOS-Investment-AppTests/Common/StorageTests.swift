//
//  StorageTests.swift
//  IOS-Investment-AppTests
//
//  Created by enki corbin on 06/01/2021.
//  Copyright © 2021 enki corbin. All rights reserved.
//

import XCTest
@testable import IOS_Investment_App

class StorageTests: XCTestCase {

    let store = Storage()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWalletStorage() {
        let toStore = 1000
        
        let stored = store.getMoneyFromWallet()
        
        store.addMoneyToWallet(amount: toStore)
        
        let storedNew = store.getMoneyFromWallet()
        
        XCTAssertEqual(storedNew, stored + toStore, "Wallet amount is wrong")
    }
    
    func testTransactions() {
        let coinId = "1"
        let profits: Float = 10.0
        let symbol = "BTC"
        
        _ = store.addTransaction(coinId: coinId, usdProfits: profits, symbol: symbol, iconData: nil)
              
        let transactions = store.getTransations()
        if transactions.count > 0 {
            XCTAssertEqual(transactions.last!.usdProfits, profits, "transaction profit is wrong")
            XCTAssertEqual(transactions.last!.symbol, symbol, "transaction symbol is wrong")
            XCTAssertEqual(transactions.last!.coinId, coinId, "Coin Id is wrong")
        } else {
            XCTAssertNil("No transactions have been added")
        }
                
    }
    
    func testBuyCoin() {
        let coinId = "1"
        let coinAmount: Float = 10.0
        let usdAmount = 200
        let boughtPrice: Float = Float(usdAmount) / coinAmount

        _ = store.sellCoin(coinId: coinId, usdAmount: usdAmount)
        _ = store.buyCoin(coinId: coinId, coinAmount: coinAmount, usdAmount: usdAmount, boughtPrice: boughtPrice)
        
        let boughtCoins = store.getBoughtCoins()
        
        if boughtCoins.count > 0 {
            XCTAssertEqual(boughtCoins.last!.amount, coinAmount, "Coin amount is wrong")
            XCTAssertEqual(boughtCoins.last!.usdAmount, usdAmount, "Usd amount symbol is wrong")
            XCTAssertEqual(boughtCoins.last!.boughtPrice, boughtPrice, "Bought price is wrong")
        } else {
            XCTAssertNil("No transactions have been added")
        }
    }

}
