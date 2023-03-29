//
//  LogInViewController.swift
//  Navigation
//
//  Created by Николай Гринько on 20.02.2023.
//


import UIKit

final class LogInViewController: UIViewController {

    private let notificationCenter = NotificationCenter.default
    private let email = "volf@yandex.ru"
    private let password = "grinya37"
    
    //login - volf@yandex.ru
    //password - grinya37

    //MARK: scrollView
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    //MARK: contentView
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: myLogoImageView
    private lazy var myLogoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    //MARK: Add stackView
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.borderWidth = 0.5
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 10
        stackView.axis = .vertical
        stackView.backgroundColor = .systemGray6
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.masksToBounds = true
        return stackView
    }()

    //MARK: emailTextFild
    private lazy var emailTextFild: UITextField = {
        let textFild = UITextField()
        textFild.layer.borderColor = UIColor.lightGray.cgColor
        textFild.layer.borderWidth = 0.5
        textFild.layer.cornerRadius = 10
        textFild.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        textFild.textColor = UIColor.black
        textFild.font = .systemFont(ofSize: 16)
        textFild.clearButtonMode = .whileEditing
        textFild.backgroundColor = UIColor.systemGray5
        textFild.placeholder = "Login or email of phone"
        textFild.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFild.frame.height))
        textFild.leftViewMode = .always
        textFild.autocapitalizationType = .none
        textFild.translatesAutoresizingMaskIntoConstraints = false
        return textFild
    }()

    //MARK: passwordTextFild
    private lazy var passwordTextFild: UITextField = {
        let textFild = UITextField()
        textFild.layer.borderColor = UIColor.lightGray.cgColor
        textFild.layer.borderWidth = 0.5
        textFild.layer.cornerRadius = 10
        textFild.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        textFild.textColor = UIColor.black
        textFild.font = .systemFont(ofSize: 16)
        textFild.clearButtonMode = .whileEditing
        textFild.backgroundColor = UIColor.systemGray5
        textFild.placeholder = "Password"
        textFild.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFild.frame.height))
        textFild.leftViewMode = .always
        textFild.autocapitalizationType = .none
        textFild.isSecureTextEntry = true
        textFild.translatesAutoresizingMaskIntoConstraints = false
        let eyeButton = UIButton(type: .custom)
            eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            eyeButton.tintColor = .lightGray
            eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

        let eyeContainer = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 20))
        eyeContainer.addSubview(eyeButton)
        eyeButton.frame = CGRect(x: -10, y: 0, width: 20, height: 20)

        textFild.rightView = eyeContainer
        textFild.rightViewMode = .always
        return textFild
    }()

    //MARK: loginButton
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(myEnterDataButton), for: .touchUpInside)
        return button
    }()

    //MARK: alertLabel
    private lazy var alertLabel: UILabel = {
        let labelAlert = UILabel()
        labelAlert.translatesAutoresizingMaskIntoConstraints = false
        labelAlert.text = "Password cannot be less than 6 characters"
        labelAlert.textColor = .red
        labelAlert.isHidden = true
        labelAlert.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return labelAlert
    }()

    @objc func togglePasswordVisibility(_ sender: UIButton) {
        passwordTextFild.isSecureTextEntry.toggle()
        let imageName = passwordTextFild.isSecureTextEntry ? "eye.slash.fill" : "eye"
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupLayout()
        emailTextFild.delegate = self
        passwordTextFild.delegate = self
        hideKeyboardTapped()
    }

    //MARK: Keyboard Observers
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationCenter.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    //MARK: Unsubscribe From Observers
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: IsValidEmail
    private func validEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    //MARK: IsValidPassword
    private func validPassword(_ password: String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,64}"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }

    
    //MARK: Action Login Button
    @objc private func myEnterDataButton () {
        if emailTextFild.text == "" || emailTextFild.text == "" {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: stackView.center.x - 10, y: stackView.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: stackView.center.x + 10, y: stackView.center.y))
            stackView.layer.add(animation, forKey: "data")
            emailTextFild.attributedPlaceholder = NSAttributedString(string: emailTextFild.placeholder ?? "",
                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            passwordTextFild.attributedPlaceholder = NSAttributedString(string: passwordTextFild.placeholder ?? "",
                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])

        }  else {
            stackView.layer.removeAnimation(forKey: "data")
        }

        if emailTextFild.text != "" && passwordTextFild.text == "" {
            let animation = CABasicAnimation(keyPath: "data")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: stackView.center.x - 10, y: stackView.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: stackView.center.x + 10, y: stackView.center.y))
            stackView.layer.add(animation, forKey: "data")
            passwordTextFild.attributedPlaceholder = NSAttributedString(string: passwordTextFild.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }
        //MARK: Validation Check email
        if validEmail(emailTextFild.text!) == false && emailTextFild.text != ""  {
            emailTextFild.text = ""
            emailTextFild.attributedPlaceholder = NSAttributedString(string: "Email is incorrect",
                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }
        
        //MARK: Validation Check email and password
        if validPassword(passwordTextFild.text!) && emailTextFild.text == ""  {
            emailTextFild.text = ""
            emailTextFild.attributedPlaceholder = NSAttributedString(string: " Введите Email",
                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }
        
        //MARK: Checking for the number of entered password characters
        if passwordTextFild.text!.count < 6 && passwordTextFild.text != "" {
            alertLabel.text = alertLabel.text
            alertLabel.isHidden = false

        } else {
            alertLabel.isHidden = true
        }

        if emailTextFild.text == email && passwordTextFild.text == password {
            let profileVC = ProfileViewController()
            navigationController?.pushViewController(profileVC, animated: true)

        } else if emailTextFild.text != "" && passwordTextFild.text != ""  {
            let alert = UIAlertController(title: "Wrong data", message: "You entered an incorrect username or password, please try again", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "try again", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
        //MARK: Validation Check password
        if validPassword(passwordTextFild.text!) == false && passwordTextFild.text != ""  {
            passwordTextFild.text = ""
            passwordTextFild.attributedPlaceholder = NSAttributedString(string: " Entered incorrectly Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }
    }

    //MARK: Keyboard display
    @objc private func keyboardShow(notification: NSNotification) {

        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let size = view.frame.height - keyboardSize.height
            scrollView.contentOffset = CGPoint(x: 0, y: loginButton.frame.origin.y - size + 100)
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }

    //MARK: Hiding the keyboard
    @objc private func keyboardHide() {
        scrollView.contentOffset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    //MARK: SetupLayout
    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(myLogoImageView)
        contentView.addSubview(stackView)
        contentView.addSubview(loginButton)
        contentView.addSubview(alertLabel)
        stackView.addArrangedSubview(emailTextFild)
        stackView.addArrangedSubview(passwordTextFild)


        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            myLogoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            myLogoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            myLogoImageView.widthAnchor.constraint(equalToConstant: 100),
            myLogoImageView.heightAnchor.constraint(equalToConstant: 100),

            stackView.topAnchor.constraint(equalTo: myLogoImageView.bottomAnchor, constant: 120),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),

            loginButton.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            alertLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            alertLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            alertLabel.bottomAnchor.constraint(equalTo: loginButton.topAnchor)
        ])
    }
}

//MARK: Extension UITextFieldDelegate
extension LogInViewController: UITextFieldDelegate {

    //MARK: Keyboard processing
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }

    //MARK: Hide keyboard
    func hideKeyboardTapped() {
        let press: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        press.cancelsTouchesInView = false
        view.addGestureRecognizer(press)
    }

    //MARK: Remove keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

