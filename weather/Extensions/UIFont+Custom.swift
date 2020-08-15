//
//  UIFont+Custom.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func robotoRegular(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: fontSize)!
    }
    
    static func robotoBold(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: fontSize)!
    }
    
    static func robotoMedium(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: fontSize)!
    }
    
    static func robotoThin(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Thin", size: fontSize)!
    }
}
