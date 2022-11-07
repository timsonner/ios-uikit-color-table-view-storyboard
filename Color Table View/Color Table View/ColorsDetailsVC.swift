//
//  ColorsDetailsVC.swift
//  Color Table View
//
//  Created by Timothy Sonner on 11/6/22.
//

import UIKit

class ColorsDetailsVC: UIViewController {
    
    var color: UIColor?

    @IBOutlet weak var redLabel: UILabel!
    
    // MARK: UISlider RGB Red
    @IBAction func redSlider(_ sender: UISlider) {
        // colorAttributes will be a ColorAttributes object
        let colorAttributes = color?.getRGBValues(color: color!)
        redLabel.text = String(sender.value)
        
        // MARK: Create new color from slider value
        let updatedColor = color?.setRGBValues(color: color!, red: CGFloat(sender.value), green: colorAttributes!.floatGreen, blue: colorAttributes!.floatBlue, alpha: colorAttributes!.floatAlpha)
        // MARK: Update view background to new color
        view.backgroundColor = updatedColor
    }
    
    // MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Set view background color on load
        view.backgroundColor = color ?? .white

        // MARK: Get attributes of color
        // Initialize slider with value of color attribute.
        let colorAttributes = color?.getRGBValues(color: color!)
        redLabel.text = "\(colorAttributes!.floatRed)"
    }
    
}
