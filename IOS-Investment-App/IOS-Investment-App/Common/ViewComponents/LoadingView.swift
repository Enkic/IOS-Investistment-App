//
//  LoadingView.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 19/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    let loadingView = UIView()
    let spinner = UIActivityIndicatorView()
    let loadingLabel = UILabel()
    
    init(parentViewFrame: CGRect, navigationControllerHeight: CGFloat) {
        let width: CGFloat = 120
        let height: CGFloat = 30
        let x = (parentViewFrame.width / 2) - (width / 2)
        let y = (parentViewFrame.height / 2) - (height / 2) - navigationControllerHeight

        super.init(frame: CGRect(x: x, y: y, width: width, height: height))

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupView() {
        loadingLabel.textColor = .gray
        loadingLabel.textAlignment = .center
        loadingLabel.text = "Loading..."
        loadingLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 30)

        spinner.style = .medium
        spinner.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        spinner.startAnimating()

        addSubview(spinner)
        addSubview(loadingLabel)
        
        isHidden = true
    }
    
    func showIndicator() {
        isHidden = false
    }
    
    func hideIndicator() {
        isHidden = true
    }
    
}
