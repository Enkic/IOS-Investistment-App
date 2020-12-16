//
//  HomTabBarWireframe.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 11/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import UIKit

final class HomeWireframe: BaseWireframe {

    // MARK: - Private properties -
    private let _storyboard = UIStoryboard(name: "Main", bundle: nil)

    // MARK: - Module setup -
    let moduleViewController = HomeTabBarController()

    init() {
        super.init(viewController: moduleViewController)
        
        let presenter = HomePresenter(wireframe: self, view: moduleViewController)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension HomeWireframe: HomeWireframeInterface {
   
    func getTabBarControllers() -> [UIViewController] {
        let marketsWireframe = MarketsWireframe()
        let portfolioWireframe = PortfolioWireframe()

        return [portfolioWireframe.moduleViewController, marketsWireframe.moduleViewController]
    }

    
}
