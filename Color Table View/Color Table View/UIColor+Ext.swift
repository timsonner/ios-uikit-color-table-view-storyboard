//
//  UIColor+Ext.swift
//  Color Table View
//
//  Created by Timothy Sonner on 11/6/22.
//

import UIKit


extension UIColor {
    // Declare static, so all instances of UIColor have access to the randomColor
    // MARK: Generate Random Color
    static func random() -> UIColor {
        let red = CGFloat.random(in: 0...1.0)
        let green = CGFloat.random(in: 0...1.0)
        let blue = CGFloat.random(in: 0...1.0)
        let alpha = CGFloat(1)
        
        let randomColor = UIColor(cgColor: CGColor(red: red, green: green, blue: blue, alpha: alpha))
        print("✅ UIColor.random() \(randomColor)")
        return randomColor
    }
    // MARK: Get RGB Values Of A Color
    func getRGBValues(color: UIColor) {
        var coreImageColor: CIColor {
                return CIColor(color: self)
            } // coreImageColor properties are Floats, ex: coreImageColor.red will be 0.687132880280259
        
        // Convert Floats to Ints
        let intRed = Int(coreImageColor.red * 255.0)
        let intGreen = Int(coreImageColor.green * 255.0)
        let intBlue = Int(coreImageColor.blue * 255.0)
        let intAlpha = Int(coreImageColor.alpha * 255.0)
        
        // Skip conversion to hex and go straight from int to hex string.
        // let hexColor = String(format: "#%02x%02x%02x", intRed, intGreen, intBlue)
        
        // Convert Ints to Hex String
        let hexStringRed = String(format: "%02X", intRed)
        let hexStringGreen = String(format: "%02X", intGreen)
        let hexStringBlue = String(format: "%02X", intBlue)
        let hexStringAlpha = String(format: "%02X", intAlpha)
        
        // Create Hex Color from RGB Hex Values
        // let hexColor = "#" + hexStringRed + hexStringGreen + hexStringBlue
        let hexColor = String("0x\(hexStringRed)\(hexStringGreen)\(hexStringBlue)")

        print("✅ UIColor.getRGBValues() Float values... red: \(coreImageColor.red), green: \(coreImageColor.green), blue: \(coreImageColor.blue), alpha: \(coreImageColor.alpha)")
        print("✅ UIColor.getRGBValues() Int values... red: \(intRed), green: \(intGreen), blue: \(intBlue), alpha: \(intAlpha)")
        print("✅ UIColor.getRGBValues() Hex values... red: \(hexStringRed), green: \(hexStringGreen), blue: \(hexStringBlue), alpha: \(hexStringAlpha)")
        print("✅ UIColor.getRGBValues() Hex Color... \(hexColor)")
        
        // return whatever data is relevant
    }
    
    // MARK: Set RGB Values Of A Color
    func setRGBValues(color: UIColor, red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {

        var components = color.cgColor.components!
           
        components[0] = red
        components[1] = green
        components[2] = blue
        components[3] = alpha
        
        return UIColor(cgColor: CGColor(red: components[0], green: components[1], blue: components[2], alpha: components[3]))
    }
}

