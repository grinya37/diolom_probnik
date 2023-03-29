//
//  PostViewController.swift
//  Navigation
//
//  Created by Николай Гринько on 31.01.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    private var topInsetView = UIView()
    
    private var myPost: String?
    
    
    init(myPost: String? = nil) {
        self.myPost = myPost
        super.init(nibName: nil, bundle: nil)
        title = myPost
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        navigationItem.title = "post"
        topInsetView.backgroundColor = .white
        view.addSubview(topInsetView)
        makeBarItems()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topInsetView.backgroundColor = .white
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
