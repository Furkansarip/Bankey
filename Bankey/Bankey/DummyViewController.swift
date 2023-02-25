//
//  DummyViewController.swift
//  Bankey
//
//  Created by Furkan Sarı on 25.02.2023.
//

import UIKit
protocol DummyViewControllerProtocol : AnyObject {
    func didLogOut()
}

class DummyViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let logOut = UIButton(type: .system)
    weak var delegate : DummyViewControllerProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension DummyViewController {
    func style() {
        view.backgroundColor = .systemBackground // ! dont forget
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        
        // Label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "Welcome"
        
        //Button
        logOut.translatesAutoresizingMaskIntoConstraints = false
        logOut.configuration = .filled()
        logOut.setTitle("Logout", for: .normal)
        logOut.addTarget(self, action: #selector(loggedOut), for: .primaryActionTriggered)
    }
    
    func layout() {
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logOut)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
    
    @objc func loggedOut() {
        delegate?.didLogOut()
    }
}
