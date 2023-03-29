//
//  InfoViewController.swift
//  Navigation
//
//  Created by Николай Гринько on 31.01.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private var topInsetView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        topInsetView.backgroundColor = .white
        view.addSubview(topInsetView)
        backAction()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topInsetView.frame = CGRect(x: 0, y: 0,
                                    width: view.frame.width,
                                    height: view.safeAreaInsets.top)
    }
    
    
    @objc private func backAction() {
        let alertController = UIAlertController(title: "Заголовок", message: "Описание", preferredStyle: .alert)
        let acrtion1 = UIAlertAction(title: "Default", style: .default) { (action:UIAlertAction) in
            print("Default")
        }
        
        let acrtion2 = UIAlertAction(title: "Destruction", style: .default) { (action:UIAlertAction) in
            print("Destruction")
        }
        
        let acrtion3 = UIAlertAction(title: "Cancel", style: .default) { (action:UIAlertAction) in
            print("Cancel")
        }
        
        alertController.addAction(acrtion1)
        alertController.addAction(acrtion2)
        alertController.addAction(acrtion3)
        
        present(alertController, animated: true, completion: nil)
    }
}
