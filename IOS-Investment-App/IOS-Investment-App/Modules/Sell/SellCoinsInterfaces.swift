//
//  SellCoinsInterfaces.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 19/12/2020.
//  Copyright (c) 2020 enki corbin. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import Coinpaprika

protocol SellCoinsWireframeInterface: WireframeInterface {
    func popViewController()
}

protocol SellCoinsViewInterface: ViewInterface {
    
    func updateCoinView(coin: Ticker)
    func updateCoinView(coin: CoinBoughtEntity)
    func updateChartView(ohlcv: [Ohlcv])
    
    func sellCoinCallBack(success: Bool)
    
}

protocol SellCoinsPresenterInterface: PresenterInterface {
    //Input
    func popViewController()

    func getCoinBoughtInfos()
    func getCoinOhlcv(from date: Date)
    func sellCoin()
    func getCoinInfos()
    
    //Output
    func didGetCoinInfos(ticker: Ticker)
    func didGetCoinBoughtInfos(coin: CoinBoughtEntity)
    func didGetCoinOhlcv(ohlcv: [Ohlcv])
    func sellCoinCallBack(success: Bool)
}

protocol SellCoinsInteractorInterface: InteractorInterface {
    func getCoinInfosFromApi(for coinId: String, storeCoin: @escaping (Ticker) -> Void)
    func getCoinBoughtInfosFromApi(for coinId: String, storeCoin: @escaping (CoinBoughtEntity) -> Void)
    func getCoinOhlcvFromApi(for coinId: String, from date: Date, storeCoinOhlvc: @escaping ([Ohlcv]) -> Void)
    func getCryptoIcon(cryptoSymbol: String) -> Data?
    func sellCoin(coinId: String, usdAmount: Int) -> Bool

}

