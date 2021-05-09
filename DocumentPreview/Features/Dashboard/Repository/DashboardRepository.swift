//
//  DashboardRepository.swift
//  DocumentPreview
//
//  Created by Ali Mert on 9.05.2021.
//

import Foundation


class DashboardRepository {
    
    var searchResult: ((SearchResult) -> Void)?
    
    var networkService: DashboardService?
    
    init(networkService: DashboardService = DashboardService()) {
        self.networkService = networkService
    }
    
    func getDocumentList() {
        networkService?.getDocuments(completion: { [weak self] result in
            switch result {
            case .success(let result):
                self?.returnDocs(with: result)
            case .failure(_):
                return
            }
        })
        
    }
    
    private func returnDocs(with result: SearchResult) {
        self.searchResult?(result)
    }
    
}
