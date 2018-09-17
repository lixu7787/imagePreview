//
//  imagePriviewPCH.swift
//  imagePreview
//
//  Created by 李旭 on 2018/9/17.
//  Copyright © 2018年 李旭. All rights reserved.
//

import Foundation
import UIKit
func YRGBColorFromHexAndAlpha(rgb:Int , alpha : CGFloat)->UIColor{
    return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                   alpha:alpha)
}
let DocumentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
