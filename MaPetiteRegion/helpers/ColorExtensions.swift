//
//  ColorExtensions.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit

extension UIColor {
    
    static func rgba(r:Float, g:Float, b:Float, a:Float) -> UIColor {
        UIColor(red: CGFloat(r/25), green: CGFloat(g/255), blue: CGFloat(b/255), alpha: CGFloat(a/255))
    }
    
}

