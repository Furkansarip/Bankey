//
//  AppDelegate.swift
//  Bankey
//
//  Created by Furkan Sarı on 25.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appColor : UIColor = .systemTeal
    var window : UIWindow?
    let loginViewController = LoginViewController()
    let onboardingViewController = OnboardingContainerViewController()
    let dummyVC = DummyViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = loginViewController
        loginViewController.delegate = self
        onboardingViewController.delegate = self
        dummyVC.delegate = self
        return true
    }

}

extension AppDelegate : LoginViewControllerProtocol,OnboardingContainerViewControllerProtocol,DummyViewControllerProtocol {
    func didLogOut() {
        setRootViewController(loginViewController)
    }
    
    func didFinishOnboarding() {
        setRootViewController(dummyVC)
    }
    
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootViewController(dummyVC)
        } else {
            setRootViewController(onboardingViewController)
        }
        
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

