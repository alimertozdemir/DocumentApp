//
//  DashboardViewModel.swift
//  DocumentPreview
//
//  Created by Ali Mert on 9.05.2021.
//

import Foundation


final class DashboardViewModel {
    
    // Outputs
    var documentList: LiveData<Loadable<[Document]?>> = LiveData()
    
    private var repository: DashboardRepository?
    
    init(repository: DashboardRepository = DashboardRepository()) {
        self.repository = repository
    }
    
    func getDocs(nameSurname: String?) {
        documentList.value = .loading
        
        repository?.getDocumentList()
        
        repository?.searchResult = { [weak self] result in
            self?.documentList.value = .loaded(result.search)
        }
    }
    
}
