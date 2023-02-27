//
//  UITextField+Ext.swift
//  Bankey
//
//  Created by Furkan Sarı on 27.02.2023.
//

import UIKit

let passwordToggleButton = UIButton(type: .custom)
extension UITextField {
    func enablePasswordToggle() {
        passwordToggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = passwordToggleButton
        rightViewMode = .always
        
    }
    
    @objc func togglePasswordView() {
       
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
    
}
