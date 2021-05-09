//
//  LoginService.swift
//  DocumentPreview
//
//  Created by Ali Mert on 9.05.2021.
//

import Foundation

class LoginService: APIClient {
    
    private let path = "a5a85d1c-c776-4fad-98af-5fdd88833a27"
    
    func doLogin(completion: @escaping (Result<User, APIError>) -> Void) {
        let request = URLRequest(url: URL(string: Endpoint.baseUrl + "\(path)")!)
        fetch(with: request, decode: { json -> User? in
            guard let result = json as? User else { return  nil }
            return result
        }, completion: completion)
    }
    
}
