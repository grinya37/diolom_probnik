//
//  UITabBarController.swift
//  Navigation
//
//  Created by Николай Гринько on 30.01.2023.
//
import UIKit


final class TabBarController: UITabBarController {
    
    private let feedVC = FeedViewController()
    private let profileVC = ProfileViewController()
    private let postVC = PostViewController()
    private let loginVC = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupControllers()
    }
    
    private func setupControllers() {
        let navigationController = UINavigationController(rootViewController: feedVC)
        feedVC.tabBarItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "house.circle")
        
        let loginController = UINavigationController(rootViewController: loginVC)
        loginVC.tabBarItem.title = "Профиль"
        loginVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        
        viewControllers = [loginController, navigationController]
    }
}


//
//final class TabBarController: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupTabBarController()
//    }
//
//
//
//    private let feedViewController = UINavigationController(rootViewController: FeedViewController())
//
//    private let profileViewController = UINavigationController(rootViewController: ProfileViewController())
//
//
//
//    private func setupTabBarController() {
//        self.tabBar.backgroundColor = .white
//        viewControllers = [profileViewController, feedViewController]
//        feedViewController.tabBarItem.title = "Feed"
//        feedViewController.tabBarItem.image = TabBarPictures.feedImage
//        profileViewController.tabBarItem.title = "Profile"
//        profileViewController.tabBarItem.image = TabBarPictures.profileImage
//    }
//}
