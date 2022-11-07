//
//  UIColor+Ext.swift
//  Color Table View
//
//  Created by Timothy Sonner on 11/6/22.
//

import UIKit


extension UIColor {
    
    struct ColorAttributes {
        internal init(floatRed: CGFloat, floatGreen: CGFloat, floatBlue: CGFloat, floatAlpha: CGFloat, intRed: Int, intGreen: Int, intBlue: Int, intAlpha: Int, hexStringRed: String, hexStringGreen: String, hexStringBlue: String, hexStringAlpha: String, hexStringColorValueInHex: String) {
            self.floatRed = floatRed
            self.floatGreen = floatGreen
            self.floatBlue = floatBlue
            self.floatAlpha = floatAlpha
            self.intRed = intRed
            self.intGreen = intGreen
            self.intBlue = intBlue
            self.intAlpha = intAlpha
            self.hexStringRed = hexStringRed
            self.hexStringGreen = hexStringGreen
            self.hexStringBlue = hexStringBlue
            self.hexStringAlpha = hexStringAlpha
            self.hexStringColorValueInHex = hexStringColorValueInHex
        }
        
        // Floats
        let floatRed: CGFloat
        let floatGreen: CGFloat
        let floatBlue: CGFloat
        let floatAlpha: CGFloat
        
        // Ints
        let intRed: Int
        let intGreen: Int
        let intBlue: Int
        let intAlpha: Int
        
        // Hex Strings
        let hexStringRed: String
        let hexStringGreen: String
        let hexStringBlue: String
        let hexStringAlpha: String
        let hexStringColorValueInHex: String
        
    }
    
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
    func getRGBValues(color: UIColor) -> ColorAttributes {
        var floatRGBValues: CIColor {
            return CIColor(cgColor: color.cgColor)
            } // coreImageColor properties are Floats, ex: coreImageColor.red will be 0.687132880280259
        
        // Convert Floats to Ints
        let intRed = Int(floatRGBValues.red * 255.0)
        let intGreen = Int(floatRGBValues.green * 255.0)
        let intBlue = Int(floatRGBValues.blue * 255.0)
        let intAlpha = Int(floatRGBValues.alpha * 255.0)
        
        // Skip conversion to hex and go straight from int to hex string.
        // let hexColor = String(format: "#%02x%02x%02x", intRed, intGreen, intBlue)
        
        // Convert Ints to Hex String
        let hexStringRed = String(format: "%02X", intRed)
        let hexStringGreen = String(format: "%02X", intGreen)
        let hexStringBlue = String(format: "%02X", intBlue)
        let hexStringAlpha = String(format: "%02X", intAlpha)
        
        // Create Hex Color from RGB Hex Values
        // let hexColor = "#" + hexStringRed + hexStringGreen + hexStringBlue
        let hexStringColorValue = String("0x\(hexStringRed)\(hexStringGreen)\(hexStringBlue)")

//        print("✅ UIColor.getRGBValues() Float values... red: \(floatRGBValues.red), green: \(floatRGBValues.green), blue: \(floatRGBValues.blue), alpha: \(floatRGBValues.alpha)")
//        print("✅ UIColor.getRGBValues() Int values... red: \(intRed), green: \(intGreen), blue: \(intBlue), alpha: \(intAlpha)")
//        print("✅ UIColor.getRGBValues() Hex values... red: \(hexStringRed), green: \(hexStringGreen), blue: \(hexStringBlue), alpha: \(hexStringAlpha)")
//        print("✅ UIColor.getRGBValues() Hex Color... \(hexStringColorValue)")
        
        // return a ColorAttributes Struct Object
        let colorAttributesObject = ColorAttributes(floatRed: floatRGBValues.red, floatGreen: floatRGBValues.green, floatBlue: floatRGBValues.blue, floatAlpha: floatRGBValues.alpha, intRed: intRed, intGreen: intGreen, intBlue: intBlue, intAlpha: intAlpha, hexStringRed: hexStringRed, hexStringGreen: hexStringGreen, hexStringBlue: hexStringBlue, hexStringAlpha: hexStringAlpha, hexStringColorValueInHex: hexStringColorValue)
        print(colorAttributesObject)
        return colorAttributesObject
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

