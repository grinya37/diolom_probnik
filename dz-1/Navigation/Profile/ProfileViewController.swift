//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Николай Гринько on 30.01.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    private var topInsetView = UIView()
    
    var profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        navigationItem.title = "Profile"
        navigationController?.navigationBar.backgroundColor = .blue
        makeBarItems()
        topInsetView.backgroundColor = .black
        view.addSubview(profileHeaderView)
        view.addSubview(topInsetView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileHeaderView.frame = view.bounds
        
        profileHeaderView.backgroundColor = .lightGray
        topInsetView.frame = CGRect(x: 0, y: 0,
                                    width: view.frame.width,
                                    height: view.safeAreaInsets.top)
    }
    
    private func makeBarItems() {
        let barItem = UIBarButtonItem(title: "👉", style: .plain, target: self, action: #selector(barItemAction))
        navigationItem.rightBarButtonItem = barItem
    }
    @objc private func barItemAction() {
        let infoVC = InfoViewController()
        infoVC.title = "feedVC"
        infoVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(infoVC, animated: true)
    }
}
