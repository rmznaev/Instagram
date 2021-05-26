//
//  LoginViewController.swift
//  Instagram
//
//  Created by Ramazan Abdullayev on 25.05.21.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
        static let textFieldHeight: CGFloat = 52.0
    }
    
    private let headerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        let bgImageView = UIImageView(image: UIImage(named: "gradient"))
        view.addSubview(bgImageView)
        
        return view
    }()
    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.autocapitalizationType = .none
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = Constants.cornerRadius
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.returnKeyType = .continue
        field.autocorrectionType = .no
        field.isSecureTextEntry = true
        field.layer.masksToBounds = true
        field.autocapitalizationType = .none
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = Constants.cornerRadius
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapLoginButton),
            for: .touchUpInside
        )
        
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapCreateAccountButton),
            for: .touchUpInside
        )
        
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapTermsButton),
            for: .touchUpInside
        )
        
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapPrivacyButton),
            for: .touchUpInside
        )
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameEmailField.delegate = self
        passwordField.delegate = self
        view.backgroundColor = .systemBackground
        
        addSubviews()
    }
    
    private func addSubviews() {
        view.addSubview(headerView)
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assign frames
        
        headerView.frame = CGRect(
            x: 0,
            y: 0, // view.safeAreaInsets.top
            width: view.width,
            height: view.height / 3
        )
        
        usernameEmailField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 40,
            width: view.width - 50,
            height: Constants.textFieldHeight
        )
        
        passwordField.frame = CGRect(
            x: 25,
            y: usernameEmailField.bottom + 10,
            width: view.width - 50,
            height: Constants.textFieldHeight
        )
        
        loginButton.frame = CGRect(
            x: 25,
            y: passwordField.bottom + 10,
            width: view.width - 50,
            height: Constants.textFieldHeight
        )
        
        createAccountButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom + 10,
            width: view.width - 50,
            height: Constants.textFieldHeight
        )
        
        termsButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 100,
            width: view.width - 20,
            height: 50
        )
        
        privacyButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 50,
            width: view.width - 20,
            height: 50
        )
        
        configureHeaderView()
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else { return }
        
        guard let backgroundView = headerView.subviews.first else { return }
        backgroundView.frame = headerView.bounds
        
        // Add Instagram logo
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(
            x: headerView.width/4,
            y: view.safeAreaInsets.top,
            width: headerView.width/2,
            height: headerView.height - view.safeAreaInsets.top
        )
    }
    
    @objc private func didTapLoginButton() {
        usernameEmailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
            return
        }
        
        var username: String?
        var email: String?
        
        // login functionality
        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            // email
            email = usernameEmail
        } else {
            // username
            username = usernameEmail
        }
        
        AuthManager.shared.loginUser(username: username, email: email, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    // user logged in
                    self.dismiss(animated: true, completion: nil)
                } else {
                    // error occured
                    let alert = UIAlertController(title: "Log In Error",
                                                  message: "We were unable to log you in.",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss",
                                                  style: .cancel,
                                                  handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    @objc private func didTapTermsButton() {
        guard let url = URL(string: "https://www.instagram.com/about/legal/terms/before-january-19-2013/") else { return }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string: "https://www.instagram.com/terms/accept/") else { return }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapCreateAccountButton() {
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            didTapLoginButton()
        }
        
        return true
    }
}
