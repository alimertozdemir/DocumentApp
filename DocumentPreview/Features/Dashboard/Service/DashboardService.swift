//
//  DashboardService.swift
//  DocumentPreview
//
//  Created by Ali Mert on 9.05.2021.
//

import Foundation


class DashboardService: APIClient {
    
    private let path = "aafc3daf-ba06-4366-8a0f-183d432eb28b"
    
    func getDocuments(completion: @escaping (Result<SearchResult, APIError>) -> Void) {
        // Create API HTTP Request Payload
        //let request = Endpoint(path: self.path, httpMethod: .get, headers: [:], body: Data(), queryItems: []).request
        let request = URLRequest(url: URL(string: BASE_URL + "/\(path)")!)

        httpRequest(with: request, decode: { json -> SearchResult? in
            guard let result = json as? SearchResult else { return  nil }
            return result
        }, completion: completion)
    }
}
