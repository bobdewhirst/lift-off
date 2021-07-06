//
//  LaunchCell.swift
//  Lift-Off
//
//  Created by Bobby Dev on 05/07/2021.
//

import Foundation
import UIKit

final class LaunchCell: UITableViewCell {
    
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var launchDate: UILabel!
    @IBOutlet private weak var success: UILabel!
    @IBOutlet private weak var patchImage: UIImageView!
    
    func configure(with launch: Launch) {
        name.text = launch.name ?? "unknown"
        launchDate.text = launch.date_local ?? "unknown"
        if let wasSuccess = launch.success {
            success.text = wasSuccess ? "Yes" : "No"
        } else {
            success.text = "unknwown"
        }

        if let patchURLString = launch.links.patch.small, let url = URL(string: patchURLString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
                DispatchQueue.main.async {
                    if let data = data {
                        self.patchImage.image = UIImage(data: data)
                    }
                }
            }).resume()
        }
    }
}
