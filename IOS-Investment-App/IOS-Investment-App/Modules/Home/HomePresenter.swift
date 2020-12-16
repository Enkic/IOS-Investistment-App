//
//  Presenter.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 11/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import UIKit

final class HomePresenter: HomePresenterInterface {

    private unowned var _view: HomeViewInterface
    private var _wireframe: HomeWireframeInterface
    
    init(wireframe: HomeWireframeInterface, view: HomeViewInterface) {
        _wireframe = wireframe
        _view = view
    }
    
    func getTabBarControllers() -> [UIViewController] {

        return _wireframe.getTabBarControllers()
    }
    
}
