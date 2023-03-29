//
//  FeedViewController.swift
//  Navigation
//
//  Created by Николай Гринько on 30.01.2023.
//


import UIKit

class FeedViewController: UIViewController {
  
    private let  myPost = Post(title: "My post")

    private var topInsetView = UIView()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemGray4
        stackView.layer.cornerRadius = 4
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let viewPostButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Посмотреть пост", for: .normal)
        button.backgroundColor = .systemRed
        return button
    }()
    
    private func setupButton() {
        view.addSubview(viewPostButton)
        viewPostButton.center = view.center
        viewPostButton.addTarget(self, action: #selector(tapEditAction), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        navigationItem.title = "Feed"
        
        topInsetView.backgroundColor = .white
        view.addSubview(topInsetView)
        
        setupStackView()
     
    }
  
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topInsetView.frame = CGRect(x: 0, y: 0,
                                    width: view.frame.width,
                                    height: view.safeAreaInsets.top)
    }

    private func setupStackView() {
        view.addSubview(stackView)
        view.addSubview(viewPostButton)
        viewPostButton.center = view.center
        viewPostButton.addTarget(self, action: #selector(tapEditAction), for: .touchUpInside)
    }

    @objc func tapShowAction() {
            let postVC = PostViewController(myPost: myPost.title)
            navigationController?.pushViewController(postVC, animated: true)
        }

    @objc func tapEditAction() {
            let postVC = PostViewController(myPost: myPost.title)
            navigationController?.pushViewController(postVC, animated: true)
        }
}
