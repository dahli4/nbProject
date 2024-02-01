//
//  tabBarController.swift
//  Insta
//
//  Created by A on 2024/01/31.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .cyan
        firstViewController.tabBarItem = UITabBarItem(title: "First", image: UIImage(named: "Profile - Fill"), tag: 0)


        viewControllers = [firstViewController]
    }
}
