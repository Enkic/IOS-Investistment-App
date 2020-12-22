//
//  Alert.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 20/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class Alert {
    
    /**
     Present a basic alert
     - Parameters:
        -   title: title of the alert
        -   message: content of the alert
        -   controller: The controller on wich to display the alert
     */
    static func show(title: String, message: String, controller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
    
    /**
     Get an attributed text
     - Parameters:
        -   text: the string
        -   fontName: the name of the font
        -   fontSize: the size of the font
     */
    fileprivate static func getAttrText(text: String, fontSize: CGFloat, color: UIColor) -> NSAttributedString {
        let attrText = NSAttributedString(string: text, attributes: [
            NSAttributedString.Key.foregroundColor : color
        ])
        
        return attrText
    }
    
    /**
     Set the appearance of the alert view
     - Parameters:
        -   alert: A reference to an alert controller
     */
    private static func setupAlertView(alert: inout UIAlertController) {
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView

        subview.layer.cornerRadius = 100
        subview.backgroundColor = UIColor(red: 50 / 255, green: 50 / 255, blue: 50 / 255, alpha: 1)
        subview.tintColor = UIColor.white
        alert.view.tintColor = UIColor.init(red: 232 / 255, green: 198 / 255, blue: 53 / 255, alpha: 1)
        alert.view.clipsToBounds = true

    }
    
    /**
     Add an animation from a json file
     - Parameters:
        -   alert: A reference to an alert controller
        -   animName: The name of the animation file
     */
    private static func addAnimation(to alert: inout UIAlertController, animName: String) {
        let animation = AnimationView(name: animName)

        alert.view.addSubview(animation)
        animation.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addConstraint(NSLayoutConstraint(item: animation, attribute: .centerX, relatedBy: .equal, toItem: alert.view, attribute: .centerX, multiplier: 1, constant: 0))
        alert.view.addConstraint(NSLayoutConstraint(item: animation, attribute: .top, relatedBy: .equal, toItem: alert.view, attribute: .top, multiplier: 1, constant: 10))
        alert.view.addConstraint(NSLayoutConstraint(item: animation, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0))
        alert.view.addConstraint(NSLayoutConstraint(item: animation, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0))
        
        animation.play()
    }
    
    /**
     Present an alert with specials actions
     - Parameters:
        -   title: title of the alert
        -   message: content of the alert
        -   controller: The controller on wich to display the alert
        -   actions: The actions button
     */
    static func show(animName: String, message: String?, controller: UIViewController, actions: [UIAlertAction]) {
        var alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let lineBreakSpace = (0..<4).map({ _ in "\n" }).reduce("", +)
        let attrMessage = getAttrText(text: lineBreakSpace + (message ?? ""), fontSize: 21, color: UIColor.white)
        
        controller.view.endEditing(true)
        setupAlertView(alert: &alert)
        alert.setValue(attrMessage, forKey: "attributedMessage")
        addAnimation(to: &alert, animName: animName)
        for action in actions {
            action.setValue(UIColor(red: 232 / 255, green: 198 / 255, blue: 53 / 255, alpha: 1), forKey: "titleTextColor")
            alert.addAction(action)
        }
        alert.preferredAction = actions.last
        controller.present(alert, animated: true)
    }
    
    /**
     Present an alert for editing the current tour properties
     - Parameters:
        -   title: title of the alert
        -   message: content of the alert
        -   controller: The controller on wich to display the alert
        -   completionHandler: The handler that need to be called after the user response
     */
    static func showMoneyInput(animName: String, message: String?, controller: UIViewController, completionHandler: @escaping (_ textEnter: String) -> Void) {
        var alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let lineBreakSpace = (0..<4).map({ _ in "\n" }).reduce("", +)
        let attrMessage = getAttrText(text: lineBreakSpace + (message ?? ""), fontSize: 21, color: UIColor.black)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let submitAction = UIAlertAction(title: "Add", style: .default) { [weak alert] _ in
            let answer = alert?.textFields![0]
            
            answer?.text != nil ? completionHandler(answer!.text!) : completionHandler("")
        }
        
        alert.setValue(attrMessage, forKey: "attributedMessage")
        addAnimation(to: &alert, animName: animName)

        alert.addTextField { (textField) in
            textField.keyboardType = .numberPad
            textField.placeholder = ""
        }
        alert.addAction(cancelAction)
        alert.addAction(submitAction)
        alert.preferredAction = cancelAction

        controller.present(alert, animated: true)
    }
                
}
