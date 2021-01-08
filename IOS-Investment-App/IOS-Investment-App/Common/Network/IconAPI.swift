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
    
    func getUrlIcon(for symbolName: String) -> URL? {
        let url = iconesUrl + symbolName.lowercased() + iconeSizeUrl
        guard let urlEncoded = URL(string: url) else { return nil }

        return urlEncoded
    }
    
}
