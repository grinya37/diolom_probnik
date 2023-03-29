//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Николай Гринько on 07.02.2023.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    var avatarImageView: UIImageView {
        let image = UIImage(named: "Volf")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 20, y: 110, width: 130, height: 130)
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.layer.masksToBounds = true
        let borderColor = UIColor.white
        imageView.layer.borderColor = borderColor.cgColor
        imageView.layer.borderWidth = 4
        return imageView
    }
    
    private var textLabel: UILabel {
        let label = UILabel(frame: CGRect(x: 170, y: 115, width: 200, height: 40))
        label.backgroundColor = .lightGray
        label.text = "Wolf Killer"
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }
    
    
    private lazy var myTextFields: UITextField = {
        let myTextFields = UITextField()
        myTextFields.frame = CGRect(x: 170, y: 170, width: 180, height: 50)
        myTextFields.borderStyle = .none
        myTextFields.placeholder = "Waiting for something..."
        myTextFields.layer.cornerRadius = 30
        myTextFields.backgroundColor = .lightGray
        return myTextFields
    }()
    
    
    private var mainButton: UIButton {
        
        let button = UIButton(frame: CGRect(x: 20, y: 255, width: 340, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }
   
    
    
    @objc func buttonPressed() {
        print(myTextFields.text ?? "")
        
    }
    private func setupUI() {
        
        self.addSubview(avatarImageView)
        self.addSubview(myTextFields)
        self.addSubview(textLabel)
        self.addSubview(mainButton)
        
    }
     init() {
         super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



    
    
    



