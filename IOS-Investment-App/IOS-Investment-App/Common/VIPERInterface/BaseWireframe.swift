//
//  BaseWireframe.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 01/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import Foundation
import UIKit

protocol WireframeInterface: class {
}

class BaseWireframe {

    private unowned var privateViewController: UIViewController

    // To retain view controller reference upon first access
    private var temporaryStoredViewController: UIViewController?

    init(viewController: UIViewController) {
        temporaryStoredViewController = viewController
        privateViewController = viewController
    }

}

extension BaseWireframe: WireframeInterface {

}

extension BaseWireframe {

    var viewController: UIViewController {
        defer { temporaryStoredViewController = nil }
        return privateViewController
    }

    var navigationController: UINavigationController? {
        return viewController.navigationController
    }

}

extension UIViewController {

    func presentWireframe(_ wireframe: BaseWireframe, animated: Bool = true, completion: (()->())? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }

}

extension UINavigationController {

    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        pushViewController(wireframe.viewController, animated: animated)
    }

    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        setViewControllers([wireframe.viewController], animated: animated)
    }

}
