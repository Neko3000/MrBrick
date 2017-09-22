//
//  CreateUIColorFromHex.swift
//  MrBrick
//
//  Created by Xueliang Chen on 9/22/17.
//  Copyright © 2017 Conceptual. All rights reserved.
//

import Foundation
import UIKit

//use like this UIColor(rgb: 0xffffff, alphaVal: 0.2)
extension UIColor{
    convenience init(rgb: UInt, alphaVal: CGFloat) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: alphaVal
        )
    }
}
