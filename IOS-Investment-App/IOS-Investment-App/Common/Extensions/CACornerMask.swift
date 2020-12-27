//
//  CACornerMask.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 25/11/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import UIKit

extension CACornerMask {
    init(TL: Bool = false, TR: Bool = false, BL: Bool = false, BR: Bool = false) {
        var value: UInt = 0
        if TL { value += 1 }
        if TR { value += 2 }
        if BL { value += 4 }
        if BR { value += 8 }

        self.init(rawValue: value)
    }
}
