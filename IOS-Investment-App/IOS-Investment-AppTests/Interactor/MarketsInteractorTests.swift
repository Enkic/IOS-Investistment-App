//
//  MarketsInteractorTests.swift
//  IOS-Investment-AppTests
//
//  Created by enki corbin on 06/01/2021.
//  Copyright © 2021 enki corbin. All rights reserved.
//

import XCTest
@testable import IOS_Investment_App

class MarketsInteractorTests: XCTestCase {
    
    let interactor = MarketsInteractor()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMarketsCallBack(coins: [CoinEntity]) {
        if coins.count != 0 {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }

    func testGetMarkets() {
        interactor.fetchCryptos(storeCoins: testMarketsCallBack(coins:), maxRange: 5)
    }
    
    func testGetIcons() {
        if interactor.getCryptoIcon(coinSymbol: "BTC") != nil {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
