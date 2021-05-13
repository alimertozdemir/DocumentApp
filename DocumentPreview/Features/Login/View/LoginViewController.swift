//
//  LoginViewController.swift
//  DocumentPreview
//
//  Created by Ali Mert on 9.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private var loginView: LoginView! {
        willSet {
            newValue.delegate = self
        }
    }
    
    private var viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        observeViewModel()
        
    }
    
    private func observeViewModel() {
        
        viewModel.userLogin.observe { [weak self] state in
            switch state {
            case .loading:
                self?.displayAnimatedActivityIndicatorView()
            case .loaded(let user):
                self?.hideAnimatedActivityIndicatorView()
                
                print("Name: \(user.userName ?? "")")
                print("Surname: \(user.userSurname ?? "")")
                
                self?.openDashboard(user: user)
            case .failed(_):
                self?.hideAnimatedActivityIndicatorView()
            }
        }
    }
    
    private func openDashboard(user: User) {
        let dashboardVC = DashboardViewController(nibName: "DashboardScreen", bundle: nil)
        let userName = user.userName ?? ""
        let userSurname = user.userSurname ?? ""
        dashboardVC.nameSurnameText = userName + " " + userSurname
        dashboardVC.modalPresentationStyle = .fullScreen
        self.present(dashboardVC, animated: false, completion: nil)
    }
    
}

extension LoginViewController: LoginViewDelegate {
    
    func actionLoginButton(username: String, pass: String) {
        
        viewModel.doLogin(mail: username, password: pass)
    }
    
}
