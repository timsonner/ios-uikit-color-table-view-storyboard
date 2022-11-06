//
//  ColorsDetailsVC.swift
//  Color Table View
//
//  Created by Timothy Sonner on 11/6/22.
//

import UIKit

class ColorsDetailsVC: UIViewController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Data was recieved from the segue.
        view.backgroundColor = color ?? .white
    }
    
}
