//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Николай Гринько on 07.02.2023.
//


import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Volf")
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var fullNamedLabel: UILabel = {
        let label = UILabel()
        label.text = "Wolf Killer"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Waiting for something..."
        label.textColor = .systemIndigo
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusTextField: TextFieldWithPadding = {

        let textField = TextFieldWithPadding()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.placeholder = "Set your status"
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private (set) lazy var setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(avatarButtomAction), for: .touchUpInside)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayoutConstraints()
        addTap()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

   
    @objc private func avatarButtomAction(selector: UIButton) {
        statusLabel.text = statusTextField.text
    }


    
    private func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        addGestureRecognizer(tap)

    }
   
    @objc private func hideKeyboard() {
        endEditing(true)
    }

   
    private func setupLayoutConstraints() {

        addSubview(avatarImageView)
        addSubview(setStatusButton)
        addSubview(fullNamedLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)

        NSLayoutConstraint.activate([

            avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            
            fullNamedLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            fullNamedLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20),
            fullNamedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            
            statusLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20),
            statusLabel.topAnchor.constraint(equalTo: fullNamedLabel.bottomAnchor, constant: 30),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5),
            statusTextField.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20),
            statusTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            
            setStatusButton.heightAnchor.constraint(equalToConstant: 40),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 10),
            setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
        ])
    }
}

extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        setStatusButton.isEnabled = !text.isEmpty
    }

   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}


