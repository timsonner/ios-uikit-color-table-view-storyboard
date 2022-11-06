//
//  ColorsTableVC.swift
//  Color Table View
//
//  Created by Timothy Sonner on 11/5/22.
//

import UIKit

// MARK: UIViewController Code
class ColorsTableVC: UIViewController {
    
    var colors: [UIColor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        seedArrayWithColors()
    }
    
    func seedArrayWithColors() {
        for _ in 0..<50 {
            colors.append(.random()) // Method 'random' is from UIColor+Ext.Swift
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Cast generic segue.destination UIViewController as a ColorsDetailsVC
        let destination = segue.destination as! ColorsDetailsVC
        // Parameter 'sender' is type Any?, evaluate it as a UIColor.
        destination.color = sender as? UIColor
    }
}

// MARK: UITableView Code
extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource {
    // Conform to UITableviewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    // Conform to UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else {
            print("⚠️ UITableViewCell was nil.")
            return UITableViewCell()
        }
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    // Perform segue to ColorsDetailsVC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Send the color of the selected item to the ColorsDetailsVC
        let color = colors[indexPath.row]
        performSegue(withIdentifier: "ToColorsDetailsVC", sender: color)
    }
}
