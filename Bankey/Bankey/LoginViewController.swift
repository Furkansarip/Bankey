//
//  ViewController.swift
//  Bankey
//
//  Created by Furkan Sarı on 25.02.2023.
//

import UIKit

protocol LoginViewControllerProtocol : AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    
    var loginView = LoginView()
    let loginButton = UIButton(type: .system)
    let errorLabel = UILabel()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    weak var delegate : LoginViewControllerProtocol?
    var username : String? {
        return loginView.usernameTextField.text
    }
    var password : String? {
        return loginView.passwordTextField.text
    }
    
    var leadingEdgeOnScreen : CGFloat = 16
    var leadingEdgeOffScreen: CGFloat = -1000
    var titleLeadingAnchor : NSLayoutConstraint?
    var subtitleLeadingAnchor : NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(loginButton)
        view.addSubview(errorLabel)
        style()
        layout()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    
}

extension LoginViewController  {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        errorLabel.text = "Username / Password cannot be blank"
        errorLabel.textAlignment = .center
        errorLabel.textColor = .systemRed
        
        errorLabel.isHidden = true
        loginButton.configuration = .filled()
        loginButton.configuration?.imagePadding = 8
        loginButton.setTitle("Sign In", for: [])
        loginButton.addTarget(self, action: #selector(loginTapped), for: .primaryActionTriggered)
        
        titleLabel.text = "Bankey"
        titleLabel.textAlignment = .center
        titleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        
        subtitleLabel.text = "Your premium source for all things banking!"
        subtitleLabel.numberOfLines = 0
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = .preferredFont(forTextStyle: .title3)
        
        
    }
    private func layout() {
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
            
        titleLeadingAnchor = titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        titleLeadingAnchor?.isActive = true
        
        // Subtitle
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
            subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
            
        subtitleLeadingAnchor = subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        subtitleLeadingAnchor?.isActive = true
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2),
            view.centerYAnchor.constraint(equalTo: loginView.centerYAnchor),
        ])
        
        // Button
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            loginButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        // Error message
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: loginButton.bottomAnchor, multiplier: 2),
            errorLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
    }
    
}
extension LoginViewController {
    @objc func loginTapped() {
        guard let username = username,let password = password else {
            assertionFailure("Cannot be blank")
            
            return
        }
        
        if username.isEmpty || password.isEmpty {
            errorLabel.isHidden = false
            shakeButton()
        } else {
            loginButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        }
    }
}


extension LoginViewController {
    private func animate() {
        let animator1 = UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
            self.titleLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.subtitleLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator1.startAnimation()
    }
    
    private func shakeButton() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4

        animation.isAdditive = true
        loginButton.layer.add(animation, forKey: "shake")
    }
}

