//
//  LoginViewController.swift
//  Instagram
//
//  Created by Ramazan Abdullayev on 25.05.21.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let headerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let usernameEmailField: UITextField = {
        return UITextField()
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    
    @objc private func didTapLoginButton() {}
    @objc private func didTapTermsButton() {}
    @objc private func didTapPrivacyButton() {}
    @objc private func didTapCreateAccountButton() {}
}
