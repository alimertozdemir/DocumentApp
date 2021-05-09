//
//  LoginViewController.swift
//  DocumentPreview
//
//  Created by Ali Mert on 9.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var mailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    
    private var viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        observeViewModel()
        
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        print("E-Mail Address: \(mailAddress.text ?? "")")
        print("Password: \(password.text ?? "")")
        
        viewModel.doLogin(mail: mailAddress.text, password: password.text)
        
    }
    
    private func observeViewModel() {
        
        viewModel.userLogin.observe { [weak self] state in
            switch state {
            case .loading:
                self?.displayAnimatedActivityIndicatorView()
            case .loaded(let user):
                self?.hideAnimatedActivityIndicatorView()
                
                print("Name: \(user.userName ?? "")")
                print("Name: \(user.userSurname ?? "")")
                
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
