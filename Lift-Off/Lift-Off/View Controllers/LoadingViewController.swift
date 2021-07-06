//
//  LoadingViewController.swift
//  Lift-Off
//
//  Created by Bobby Dev on 04/07/2021.
//

import UIKit

final class LoadingViewController: UIViewController, HasSpaceXDataSource {
    
    private var spaceXURL: URL {
        get {
            return URL(string: Bundle.main.object(forInfoDictionaryKey: "SpaceX Data URL") as! String)!
        }
    }

    @IBOutlet weak private var activitySpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData() {
        DispatchQueue.main.async {
            self.activitySpinner.isHidden = false
            self.activitySpinner.startAnimating()
        }
        spaceXDataSource.loadData(from: spaceXURL) { result in
            switch result {
            case .success(let data):
                self.showData(data: data)
            case .failure(let error):
                self.showLoadingError(error: error)
            }
        }
    }
    
    private func showData(data: [Launch]) {
        #if DEBUG
        print(data)
        #endif
        DispatchQueue.main.async {
            self.activitySpinner.stopAnimating()
            self.performSegue(withIdentifier: "pushLaunches", sender: nil)
        }
    }

    // add some error handling and retry button here
    private func showLoadingError(error: Error) {
        print(error)
        DispatchQueue.main.async {
            self.activitySpinner.stopAnimating()
        }
    }
}
