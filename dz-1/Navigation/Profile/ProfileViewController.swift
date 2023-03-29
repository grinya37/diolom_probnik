//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Николай Гринько on 30.01.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        navigationItem.title = "Profile"
        //navigationController?.navigationBar.backgroundColor = .white
        makeBarItems()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.bounds
        view.addSubview(profileHeaderView)
        profileHeaderView.backgroundColor = .lightGray
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
