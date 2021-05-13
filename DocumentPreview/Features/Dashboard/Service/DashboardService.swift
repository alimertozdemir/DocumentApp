//
//  DashboardService.swift
//  DocumentPreview
//
//  Created by Ali Mert on 9.05.2021.
//

import Foundation


final class DashboardService: APIClient {
    
    private let path = "/v3/aafc3daf-ba06-4366-8a0f-183d432eb28b"
    
    func getDocuments(completion: @escaping (Result<SearchResult, APIError>) -> Void) {
        // Create API HTTP Request Payload
        
        let request = Endpoint(path: path, httpMethod: .get).request
        httpRequest(with: request, decode: { json -> SearchResult? in
            guard let result = json as? SearchResult else { return  nil }
            return result
        }, completion: completion)

    }
}

struct File: Encodable {
    var name: String
}
