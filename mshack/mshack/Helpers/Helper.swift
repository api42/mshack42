//
//  Helper.Swift
//  mshack
//
//  Created by Apurva Raj on 19/01/19.
//  Copyright © 2019 Apurva Raj. All rights reserved.
//

import UIKit



extension UIColor {
    
    static let backgroundColor =  UIColor.rgb(red: 207, green: 0, blue: 15, alpha: 1)
    static let outlineStrokeColor = UIColor.rgb(red: 211, green: 84, blue: 0, alpha: 1)
    static let trackStrokeColor =    UIColor.rgb(red: 192, green: 57, blue: 43, alpha: 1)
    
    static let pulsatingFillColor = UIColor.rgb(red: 231, green: 76, blue: 60, alpha: 1)
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    static func mainBlue() -> UIColor {
        return UIColor.rgb(red: 17, green: 154, blue: 237, alpha: 1)
    }
}


extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  topConstant: CGFloat, leftConstant: CGFloat, bottomConstant: CGFloat, rightConstant: CGFloat, widthConstant: CGFloat, heightConstant: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
        }
        
        if widthConstant != 0 {
            widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        }
        
        if heightConstant != 0 {
            heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
        }
    }
}
