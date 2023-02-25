//
//  ViewController.swift
//  Bankey
//
//  Created by Furkan Sarı on 25.02.2023.
//

import UIKit

class LoginViewController: UIViewController {

    var loginView = LoginView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(loginView)
        style()
        layout()
    }


}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.backgroundColor = . white
    }
    private func layout() {
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
    }
}

