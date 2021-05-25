//
//  TabBarViewController.swift
//  Instagram
//
//  Created by Ramazan Abdullayev on 25.05.21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vcOne = HomeViewController()
        let vcTwo = ExploreViewController()
        let vcThree = CameraViewController()
        let vcFour = NotificationsViewController()
        let vcFive = ProfileViewController()
        
        vcOne.title = "Home"
        vcTwo.title = "Explore"
        vcThree.title = "Camera"
        vcFour.title = "Notifications"
        vcFive.title = "Profile"
        
        vcOne.navigationItem.largeTitleDisplayMode = .always
        vcTwo.navigationItem.largeTitleDisplayMode = .always
        vcThree.navigationItem.largeTitleDisplayMode = .always
        vcFour.navigationItem.largeTitleDisplayMode = .always
        vcFive.navigationItem.largeTitleDisplayMode = .always
        
        let navOne = UINavigationController(rootViewController: vcOne)
        let navTwo = UINavigationController(rootViewController: vcTwo)
        let navThree = UINavigationController(rootViewController: vcThree)
        let navFour = UINavigationController(rootViewController: vcFour)
        let navFive = UINavigationController(rootViewController: vcFive)
        
        navOne.navigationBar.tintColor = .black
        navTwo.navigationBar.tintColor = .black
        navThree.navigationBar.tintColor = .label
        navFour.navigationBar.tintColor = .label
        navFive.navigationBar.tintColor = .label
        
        navOne.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        navTwo.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "safari"), tag: 1)
        navThree.tabBarItem = UITabBarItem(title: "Camera", image: UIImage(systemName: "plus.circle"), tag: 1)
        navFour.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage(systemName: "bell"), tag: 1)
        navFive.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 1)
        
        self.view.tintColor = .black
        
        navOne.navigationBar.prefersLargeTitles = true
        navTwo.navigationBar.prefersLargeTitles = true
        navThree.navigationBar.prefersLargeTitles = true
        navFour.navigationBar.prefersLargeTitles = true
        navFive.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navOne, navTwo, navThree, navFour, navFive], animated: true)
    }
}
