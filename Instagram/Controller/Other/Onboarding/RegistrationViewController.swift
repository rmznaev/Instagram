//
//  RegistrationViewController.swift
//  Instagram
//
//  Created by Ramazan Abdullayev on 25.05.21.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
        static let textFieldHeight: CGFloat = 52.0
    }
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username..."
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
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email address..."
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
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapRegisterButton),
            for: .touchUpInside
        )
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        view.backgroundColor = .systemBackground
        
        addSubviews()
    }
    
    private func addSubviews() {
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registerButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameField.frame = CGRect(
            x: 20,
            y: view.safeAreaInsets.top + 40,
            width: view.width - 40,
            height: Constants.textFieldHeight
        )
        
        emailField.frame = CGRect(
            x: 20,
            y: usernameField.bottom + 10,
            width: view.width - 40,
            height: Constants.textFieldHeight
        )
        
        passwordField.frame = CGRect(
            x: 20,
            y: emailField.bottom + 10,
            width: view.width - 40,
            height: Constants.textFieldHeight
        )
        
        registerButton.frame = CGRect(
            x: 20,
            y: passwordField.bottom + 20,
            width: view.width - 40,
            height: Constants.textFieldHeight
        )
    }
    
    @objc func didTapRegisterButton() {
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let username = usernameField.text, !username.isEmpty,
              let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, password.isEmpty, password.count >= 8 else {
                return
        }
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            emailField.becomeFirstResponder()
        } else if textField == emailField {
            passwordField.becomeFirstResponder()
        } else {
            didTapRegisterButton()
        }
        
        return true
    }
}
