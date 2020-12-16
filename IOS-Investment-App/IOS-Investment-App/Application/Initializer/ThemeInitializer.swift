//
//  ThemeInitializer.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 11/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import UIKit

class ThemeInitializer: InitializerInterface {

    func performInitialization() {
        UINavigationBar.appearance(whenContainedInInstancesOf:
            [MainNavigationController.self]).tintColor = .white
        UINavigationBar.appearance(whenContainedInInstancesOf: [MainNavigationController.self]).barTintColor = .background
        UINavigationBar.appearance(whenContainedInInstancesOf: [MainNavigationController.self]).titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }

}
