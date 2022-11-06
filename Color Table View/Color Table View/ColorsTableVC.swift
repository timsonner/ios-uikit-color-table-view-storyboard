//
//  ColorsTableVC.swift
//  Color Table View
//
//  Created by Timothy Sonner on 11/5/22.
//

import UIKit

// MARK: UIViewController Code
class ColorsTableVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = String(indexPath.row + 1)
        cell.contentConfiguration = content
        return cell
    }
    // Perform segue to ColorsDetailsVC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToColorsDetailsVC", sender: nil)
    }
}
