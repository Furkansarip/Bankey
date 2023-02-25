//
//  AppDelegate.swift
//  Bankey
//
//  Created by Furkan Sarı on 25.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window : UIWindow?
    let loginViewController = LoginViewController()
    let onboardingViewController = OnboardingContainerViewController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = loginViewController
        loginViewController.delegate = self
        onboardingViewController.delegate = self
        return true
    }

}

extension AppDelegate : LoginViewControllerProtocol,OnboardingContainerViewControllerProtocol {
    func didFinishOnboarding() {
        setRootViewController(loginViewController)
    }
    
    func didLogin() {
        setRootViewController(onboardingViewController)
    }
    
    func setRootViewController(_ vc: UIViewController) {
        guard let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil)
    }
}

