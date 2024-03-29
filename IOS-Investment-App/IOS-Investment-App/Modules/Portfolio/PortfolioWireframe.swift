//
//  PortfolioWireframe.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 01/12/2020.
//  Copyright (c) 2020 enki corbin. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class PortfolioWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -
    let moduleViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "Portfolio") as! PortfolioViewController

    init() {
        super.init(viewController: moduleViewController)

        let interactor = PortfolioInteractor()
        let presenter = PortfolioPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
        interactor.presenter = presenter
    }

}

// MARK: - Extensions -

extension PortfolioWireframe: PortfolioWireframeInterface {
}
