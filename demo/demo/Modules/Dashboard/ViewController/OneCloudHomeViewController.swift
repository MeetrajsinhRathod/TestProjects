//
//  OneCloudHomeViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/06/23.
//

import UIKit

class OneCloudHomeViewController: UITabBarController, StoryBoarded {
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
    }
}
