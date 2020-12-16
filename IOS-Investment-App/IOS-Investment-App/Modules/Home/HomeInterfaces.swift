//
//  HomeInterfaces.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 11/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import UIKit

enum HomeNavigationOption {
    case markets
    case portfolio
}

protocol HomeWireframeInterface: WireframeInterface {
    func getTabBarControllers() -> [UIViewController]
}


protocol HomeViewInterface: ViewInterface {
}

protocol HomePresenterInterface: PresenterInterface {
    func getTabBarControllers() -> [UIViewController]
}

