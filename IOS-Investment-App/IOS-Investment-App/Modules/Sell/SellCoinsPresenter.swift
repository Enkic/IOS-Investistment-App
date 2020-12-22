//
//  SellCoinsPresenter.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 19/12/2020.
//  Copyright (c) 2020 enki corbin. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class SellCoinsPresenter {

    // MARK: - Private properties -

    private unowned let view: SellCoinsViewInterface
    private let wireframe: SellCoinsWireframeInterface
    private let interactor: SellCoinsInteractorInterface

    private let coinId: String

    // MARK: - Lifecycle -

    init(view: SellCoinsViewInterface, interactor: SellCoinsInteractorInterface, wireframe: SellCoinsWireframeInterface, coinId: String) {
        self.view = view
        self.wireframe = wireframe
        self.interactor = interactor
        
        self.coinId = coinId
    }
    
    func didGetCoinSellInfos(coin: CoinBoughtEntity) {
        let transactionState = Storage.sellCoin(coinId: coinId, usdAmount: Int(Float(coin.usdAmount) + coin.profits!))
        let iconData = interactor.getCryptoIcon(cryptoSymbol: coin.symbol!)
        
        _ = Storage.addTransaction(coinId: coinId, usdProfits: coin.profits!, name: coin.symbol! ,iconData: iconData)
        sellCoinCallBack(success: transactionState)
    }
}

// MARK: - Extensions -

extension SellCoinsPresenter: SellCoinsPresenterInterface {
    
    func popViewController() {
        wireframe.popViewController()
    }
    
    func sellCoin() {
        interactor.getCoinBoughtInfosFromApi(for: coinId, storeCoin: didGetCoinSellInfos(coin:))
    }
    
    func sellCoinCallBack(success: Bool) {
        view.sellCoinCallBack(success: success)
    }
    
    func getCoinInfos() {
        interactor.getCoinInfosFromApi(for: coinId, storeCoin: didGetCoinInfos(coin:))
    }
    
    func getCoinBoughtInfos() {
        interactor.getCoinBoughtInfosFromApi(for: coinId, storeCoin: didGetCoinBoughtInfos(coin:))
    }
    
    func getCoinOhlcv(from date: Date) {
        interactor.getCoinOhlcvFromApi(for: coinId, from: date, storeCoinOhlvc: didGetCoinOhlcv(coin:))
    }
    
    func didGetCoinInfos(coin: CoinStocksEntity) {
        view.updateCoinView(coin: coin.ticker!)
    }
    
    func didGetCoinBoughtInfos(coin: CoinBoughtEntity) {
        view.updateCoinView(coin: coin)
    }
    
    func didGetCoinOhlcv(coin: CoinStocksEntity) {
        view.updateChartView(ohlcv: coin.ohlcv!)
    }
    
}
