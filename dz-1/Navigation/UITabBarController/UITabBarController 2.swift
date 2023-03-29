//
//  UITabBarController.swift
//  Navigation
//
//  Created by Николай Гринько on 30.01.2023.
//
import UIKit


final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
    
    private let feedViewController = UINavigationController(rootViewController: FeedViewController())
    
    private let profileViewController = UINavigationController(rootViewController: ProfileViewController())
    
   
    
    private func setupTabBarController() {
        self.tabBar.backgroundColor = .white
        viewControllers = [profileViewController, feedViewController]
        feedViewController.tabBarItem.title = "Feed"
        feedViewController.tabBarItem.image = TabBarPictures.feedImage
        profileViewController.tabBarItem.title = "Profile"
        profileViewController.tabBarItem.image = TabBarPictures.profileImage
    }
}
