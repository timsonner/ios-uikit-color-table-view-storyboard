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
            colors.append(createRandomColor())
        }
    }
    
    func createRandomColor() -> UIColor {
        let randomColor = UIColor(cgColor: CGColor(red: CGFloat.random(in: 0...1.0), green: CGFloat.random(in: 0...1.0), blue: CGFloat.random(in: 0...1.0), alpha: 1))
        return randomColor
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell")!
        let color = colors[indexPath.row]
        cell.backgroundColor = color
        return cell
    }
    // Perform segue to ColorsDetailsVC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToColorsDetailsVC", sender: nil)
    }
}
