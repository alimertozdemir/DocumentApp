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
        // Create API HTTP Request Payload
        //let request = Endpoint(path: self.path, httpMethod: .get, headers: [:], body: Data(), queryItems: []).request
        let request = URLRequest(url: URL(string: BASE_URL + "/\(path)")!)
        httpRequest(with: request, decode: { json -> User? in
            guard let result = json as? User else { return  nil }
            return result
        }, completion: completion)
    }
    
}
