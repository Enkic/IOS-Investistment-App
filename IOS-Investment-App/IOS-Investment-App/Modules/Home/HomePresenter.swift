//
//  Presenter.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 11/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import UIKit

final class HomePresenter: HomePresenterInterface {

    private unowned var view: HomeViewInterface
    private var wireframe: HomeWireframeInterface
    
    init(wireframe: HomeWireframeInterface, view: HomeViewInterface) {
        self.wireframe = wireframe
        self.view = view
    }
    
    func getTabBarControllers() -> [UIViewController] {

        return wireframe.getTabBarControllers()
    }
    
}
