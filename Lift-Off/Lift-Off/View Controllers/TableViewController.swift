//
//  TableViewController.swift
//  Lift-Off
//
//  Created by Bobby Dev on 05/07/2021.
//

import Foundation
import UIKit

final class TableViewController: UITableViewController, HasSpaceXDataSource {
    
    var data: [Launch]?
    
    override func viewDidLoad() {
        title = "Falcon 9 Launches"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spaceXDataSource.launches.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: LaunchCell = tableView.dequeueReusableCell(withIdentifier: "launchCell") as? LaunchCell {
            cell.configure(with: spaceXDataSource.launches[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}

