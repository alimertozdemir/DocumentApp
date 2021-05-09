//
//  LoginRepository.swift
//  DocumentPreview
//
//  Created by Ali Mert on 9.05.2021.
//

import Foundation

class LoginRepository {
    
    var didUserLoggedIn: ((User) -> Void)?
    
    var networkService: LoginService?
    
    init(networkService: LoginService = LoginService()) {
        self.networkService = networkService
    }
    
    func doLogin(mail: String?, password: String?) {
        networkService?.doLogin(completion: { [weak self] result in
            switch result {
            case .success(let user):
                self?.finishLogin(with: user)
            case .failure(_):
                return
            }
        })
        
    }
    
    private func finishLogin(with user: User) {
        self.didUserLoggedIn?(user)
    }
    
}
