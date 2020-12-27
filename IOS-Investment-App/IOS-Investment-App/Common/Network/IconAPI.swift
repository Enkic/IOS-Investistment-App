//
//  IconeAPI.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 27/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import UIKit

class IconAPI {
    
    let iconesUrl = "https://cryptoicons.org/api/icon/"
    let iconeSizeUrl = "/32"
    
    func getIcon(withSymbolName name: String) -> UIImage? {
        let url = iconesUrl + name.lowercased() + iconeSizeUrl
        guard let urlEncoded = URL(string: url) else { return nil }
        guard let imageData = try? Data(contentsOf: urlEncoded) else { return nil }
        
        return UIImage(data: imageData)
    }
    
}
