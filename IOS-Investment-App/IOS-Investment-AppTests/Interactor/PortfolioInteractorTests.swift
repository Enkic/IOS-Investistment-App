//
//  PortfolioInteractorTests.swift
//  IOS-Investment-AppTests
//
//  Created by enki corbin on 06/01/2021.
//  Copyright © 2021 enki corbin. All rights reserved.
//

import XCTest
@testable import IOS_Investment_App

class PortfolioInteractorTests: XCTestCase {
    
    let interactor = PortfolioInteractor()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func getBoughtCoinsCallBack(coins: [CoinBoughtEntity]) {
        
        if coins.count != 0 {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
        
    }

    func testGetBoughtCoinsWithInfos() {
        
        interactor.getBoughtCoinsInfosFromApi(storeCoins: getBoughtCoinsCallBack)
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
