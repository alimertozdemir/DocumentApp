//
//  SearchResult.swift
//  DocumentPreview
//
//  Created by Ali Mert on 9.05.2021.
//

import Foundation


struct SearchResult: Decodable {
    
    var search: [Document]?
    var totalResult: Int
    var response: Bool
}

struct Document: Decodable {
    
    var title: String
    var size: String
    var `extension`: String
    var url: String
    
}
