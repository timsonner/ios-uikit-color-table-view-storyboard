//
//  UIColor+Ext.swift
//  Color Table View
//
//  Created by Timothy Sonner on 11/6/22.
//

import UIKit

extension UIColor {
    // Declare static, so all instances of UIColor have access to the randomColor
    static func random() -> UIColor {
        let randomColor = UIColor(cgColor: CGColor(red: CGFloat.random(in: 0...1.0), green: CGFloat.random(in: 0...1.0), blue: CGFloat.random(in: 0...1.0), alpha: 1))
        return randomColor
    }
}
