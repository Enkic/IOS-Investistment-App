//
//  MarketsPresenter.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 01/12/2020.
//  Copyright (c) 2020 enki corbin. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class MarketsPresenter {

    // MARK: - Private properties -

    private unowned let view: MarketsViewInterface
    private let interactor: MarketsInteractorInterface
    private let wireframe: MarketsWireframeInterface

    // MARK: - Lifecycle -

    init(view: MarketsViewInterface, interactor: MarketsInteractorInterface, wireframe: MarketsWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
}

// MARK: - Extensions -

extension MarketsPresenter: MarketsPresenterInterface {
    
    func fetchBoughtCoins() {
        self.interactor.fetchBoughtCoins(storeCoins: self.didFetchBoughtCoins(coins:))
    }
    
    func fetchCryptos() {
        self.interactor.fetchCryptos(storeCoins: self.didfetchCryptos, maxRange: 10)
    }
    
    func didFetchBoughtCoins(coins: [CoinBoughtEntity]) {
        view.updateBoughtCoins(coins: coins)
    }

    func didTapBuyCoin(with id: String) {
        wireframe.navigate(to: .buyCoins, coinId: id)
    }

    func didTapSellCoin(with id: String) {
        wireframe.navigate(to: .sellCoins, coinId: id)
    }
    
    func didfetchCryptos(_ coins: [CoinEntity]) {
        view.updateCoins(coins: coins)
    }
    
}
