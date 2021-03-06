//
//  MyTabBarController.swift
//  Navigation
//
//  Created by apple on 13.04.2022.
//

import UIKit

class MyTabBarController: UITabBarController {
    
    let profileViewController = ProfileViewController()
    let feedViewController = FeedViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        setupControllers()
        
    }
    private func setupControllers() {
        let profileNavigController = UINavigationController(rootViewController: profileViewController)
        profileViewController.tabBarItem.title = "Profile"
        profileViewController.tabBarItem.image = UIImage(systemName: "person")
        profileViewController.navigationItem.title = "Профиль"
        profileNavigController.navigationBar.backgroundColor = .systemMint
        
        let feedNavController = UINavigationController(rootViewController: feedViewController)
        feedViewController.tabBarItem.title = "Feed"
        feedViewController.tabBarItem.image = UIImage(systemName: "newspaper")
        feedViewController.navigationItem.title = "Лента"
        feedNavController.navigationBar.backgroundColor = .systemBrown
        
        
        viewControllers = [feedNavController, profileNavigController]
    }
    
}

