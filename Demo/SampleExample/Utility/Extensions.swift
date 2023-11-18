//
//  Extensions.swift
//  SampleExample
//
//  Created by Amit Shah on 16/11/23.
//

import UIKit

extension UIButton{
    
    func customUI(){
        
        backgroundColor = [UIColor.systemRed, UIColor.systemBlue, UIColor.systemGreen].randomElement()
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        isHidden = false
        
    }
    
}

//extension UIFont{
//    let static lemonadaLight = UIFont.init(name: "Lemonada-Light", size: 40)
//}

