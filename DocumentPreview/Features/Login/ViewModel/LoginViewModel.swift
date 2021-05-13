//
//  LoginViewModel.swift
//  DocumentPreview
//
//  Created by Ali Mert on 9.05.2021.
//

import Foundation

final class LoginViewModel {
    
    // Output
    var userLogin: LiveData<Loadable<User>> = LiveData()
    
    private var repository: LoginRepository?
    
    init(repository: LoginRepository = LoginRepository()) {
        self.repository = repository
    }
    
    func doLogin(mail: String?, password: String?) {
        userLogin.value = .loading
        
        repository?.doLogin(mail: mail, password: password)
        
        repository?.didUserLoggedIn = { [weak self] user in
            self?.userLogin.value = .loaded(user)
        }
    }
    
}
