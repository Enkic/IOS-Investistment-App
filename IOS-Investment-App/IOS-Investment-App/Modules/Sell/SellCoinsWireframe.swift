//
//  SellCoinsWireframe.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 19/12/2020.
//  Copyright (c) 2020 enki corbin. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class SellCoinsWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -
    let moduleViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "SellCoin") as! SellCoinsViewController

    init(coinId: String) {
        let interactor = SellCoinsInteractor()
        super.init(viewController: moduleViewController)

        let presenter = SellCoinsPresenter(view: moduleViewController, interactor: interactor, wireframe: self, coinId: coinId)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension SellCoinsWireframe: SellCoinsWireframeInterface {
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
}
