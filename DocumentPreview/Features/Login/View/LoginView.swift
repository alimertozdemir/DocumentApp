//
//  LoginView.swift
//  DocumentPreview
//
//  Created by Ali Mert on 11.05.2021.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    
    func actionLoginButton(username: String, pass: String)
    
}

final class LoginView: UIView {

    @IBOutlet private weak var mailAddress: UITextField! {
        willSet {
            newValue.textColor = .black
        }
    }
    
    @IBOutlet private weak var password: UITextField!
    
    public weak var delegate: LoginViewDelegate?
    
    public var mailAdress: String {
        get {
            return mailAddress.text ?? ""
        }
        set {
            mailAddress.text = newValue
        }
    }
    
    @IBAction private func loginButtonAction(_ sender: Any) {
        print("E-Mail Address: \(mailAddress.text ?? "")")
        print("Password: \(password.text ?? "")")
        
        delegate?.actionLoginButton(username: mailAdress, pass: password.text ?? "")
    }

}

