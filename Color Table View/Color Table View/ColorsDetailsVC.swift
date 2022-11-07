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
    
    @IBAction func redSlider(_ sender: UISlider) {
        redLabel.text = String(sender.value)
        let colorAttributes = color?.getRGBValues(color: color!)
        let updatedColor = color?.setRGBValues(color: color!, red: CGFloat(sender.value), green: colorAttributes!.floatGreen, blue: colorAttributes!.floatBlue, alpha: colorAttributes!.floatAlpha)
        view.backgroundColor = updatedColor
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set view background color
        view.backgroundColor = color ?? .white

        // MARK: Get attributes of color
        // Initialize slider with value of color attribute
        let colorAttributes = color?.getRGBValues(color: color!)
        redLabel.text = "\(colorAttributes!.floatRed)"
    }
    
}
