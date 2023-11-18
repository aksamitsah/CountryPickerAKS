//
//  Extensions.swift
//
//
//  Created by Amit Shah on 15/11/23.
//

import UIKit

extension UIColor {
    
    static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor{
        guard #available(iOS 13.0, *) else { return light }
        return  UIColor { $0.userInterfaceStyle == .dark ? dark : light }
    }
}

extension UIImage{
    
    static let closeIcon = UIImage(named: "ic_close", in: Bundle._module, compatibleWith: nil)
    static let searchIcon = UIImage(named: "ic_search", in: Bundle._module, compatibleWith: nil)
    
}

extension UIColor{
    
    static let primary : UIColor = UIColor(named: "color_primary", in: Bundle._module, compatibleWith: nil) ?? dynamicColor(light: UIColor(red: 1, green: 1, blue: 1, alpha: 1), dark: UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1))
    
    static let secondary : UIColor = UIColor(named: "color_secondary", in: Bundle._module, compatibleWith: nil) ?? dynamicColor(light: UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1), dark: UIColor(red: 0, green: 0, blue: 0, alpha: 1))
    
    static let textColor : UIColor = UIColor(named: "color_text", in: Bundle._module, compatibleWith: nil) ?? dynamicColor(light: UIColor(red: 0, green: 0, blue: 0, alpha: 1), dark: UIColor(red: 1, green: 1, blue: 1, alpha: 1))
    
}

