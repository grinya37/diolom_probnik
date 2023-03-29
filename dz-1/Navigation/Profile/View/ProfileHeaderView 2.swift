//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Николай Гринько on 07.02.2023.
//
//
import UIKit

private var statusText: String?

class ProfileHeaderView: UIView {
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Volf")
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 20
        let borderColor = UIColor.systemBlue
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = borderColor.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var fullNamedLabel: UILabel = {
        let label = UILabel()
        label.text = "Wolf Killer"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Waiting for something..."
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusTextField: UITextField = {
        
        let textField = UITextField()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.placeholder = "Set your status"
        textField.layer.cornerRadius = 12
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textAlignment = .center
        textField.clearButtonMode = .whileEditing
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(ProfileHeaderView.self, action: #selector(textFieldAction), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(avatarButtomActionADD), for: .touchUpInside)
        return button
    }()
    
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .black
        closeButton.alpha = 0
        closeButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        return closeButton
    }()
    
    private let whiteView: UIView = {
        let viewBlack = UIView()
        viewBlack.translatesAutoresizingMaskIntoConstraints = false
        viewBlack.alpha = 0
        viewBlack.backgroundColor = .white
        viewBlack.frame = UIScreen.main.bounds
        return viewBlack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayoutConstraints()
        setupGesture()
        addTap()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc private func avatarButtomActionADD(selector: UIButton) {
        if statusTextField.text == "" {
            statusTextField.attributedPlaceholder = NSAttributedString(string: "Not empty...",
                              attributes:[NSAttributedString.Key.foregroundColor: UIColor.blue])
            
        } else if statusTextField.text != "" {
            statusTextField.attributedPlaceholder = NSAttributedString(string: "Set your status...",
                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            statusLabel.text = statusTextField.text
        }
    }
    
    @objc private func textFieldAction(_ textField:  UITextField) {
        statusText = statusLabel.text ?? ""
    }
    
    private func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        addGestureRecognizer(tap)
    }
    
    @objc private func hideKeyboard() {
        endEditing(true)
    }
    
    
    private var topImage = NSLayoutConstraint()
    private var leadingImage = NSLayoutConstraint()
    private var widthImage = NSLayoutConstraint()
    private var heightImage = NSLayoutConstraint()
    
    private func setupLayoutConstraints() {
        let inset: CGFloat = 16
        
        addSubview(avatarImageView)
        addSubview(setStatusButton)
        addSubview(fullNamedLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        
        topImage = avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        leadingImage = avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset)
        widthImage = avatarImageView.widthAnchor.constraint(equalToConstant: 100)
        heightImage = avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([
            
            topImage, leadingImage, widthImage, heightImage,
            
            fullNamedLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNamedLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 150),
            fullNamedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset),
            fullNamedLabel.heightAnchor.constraint(equalToConstant: 20),
            
            statusLabel.topAnchor.constraint(equalTo: fullNamedLabel.bottomAnchor, constant: 30),
            statusLabel.leadingAnchor.constraint(equalTo: fullNamedLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: fullNamedLabel.trailingAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 7),
            statusTextField.leadingAnchor.constraint(equalTo: fullNamedLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: fullNamedLabel.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: inset),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset),
            setStatusButton.heightAnchor.constraint(equalToConstant: 43),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionTap))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func actionTap() {
        addSubview(whiteView)
        addSubview(closeButton)
        bringSubviewToFront(avatarImageView)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.whiteView.alpha = 0.8
            self.avatarImageView.layer.cornerRadius = UIScreen.main.bounds.width / 2
            self.topImage.constant = 100
            self.leadingImage.constant = 0
            self.widthImage.constant = UIScreen.main.bounds.width
            self.heightImage.constant = UIScreen.main.bounds.width
            self.layoutIfNeeded()
            
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.closeButton.alpha = 1
            }
        }
    }
    
    @objc private func cancelAction() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            self.closeButton.alpha = 0
            
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                self.avatarImageView.layer.cornerRadius = 50
                self.topImage.constant = 20
                self.leadingImage.constant = 16
                self.widthImage.constant = 100
                self.heightImage.constant = 100
                self.whiteView.alpha = 0
                self.layoutIfNeeded()
            }
        }
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


