//
//  InfoViewController.swift
//  Navigation
//
//  Created by Николай Гринько on 31.01.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        backAction()
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
