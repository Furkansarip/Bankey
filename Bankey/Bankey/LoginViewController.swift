//
//  ViewController.swift
//  Bankey
//
//  Created by Furkan Sarı on 25.02.2023.
//

import UIKit

class LoginViewController: UIViewController {

    var loginView = LoginView()
    let loginButton = UIButton(type: .system)
    let errorLabel = UILabel()
    var username : String? {
        return loginView.usernameTextField.text
    }
    var password : String? {
        return loginView.passwordTextField.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(loginView)
        view.addSubview(loginButton)
        view.addSubview(errorLabel)
        style()
        layout()
    }


}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        errorLabel.text = "Username / Password cannot be blank"
        errorLabel.textAlignment = .center
        errorLabel.textColor = .systemRed
        errorLabel.isHidden = true
        loginButton.configuration = .filled()
        loginButton.configuration?.imagePadding = 8
        loginButton.setTitle("Sign In", for: [])
        loginButton.addTarget(self, action: #selector(loginTapped), for: .primaryActionTriggered)
        
    }
    private func layout() {
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
                
            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            loginButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginButton.trailingAnchor, multiplier: 1),
            
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: loginButton.bottomAnchor, multiplier: 2),
            errorLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorLabel.trailingAnchor, multiplier: 1)
        ])
    }
    
    @objc func loginTapped() {
        guard let username = username,let password = password else {
            assertionFailure("Cannot be blank")
            return
        }

        if username.isEmpty || password.isEmpty {
            errorLabel.isHidden = false
        } else {
            loginButton.configuration?.showsActivityIndicator = true
        }
    }
    
}

