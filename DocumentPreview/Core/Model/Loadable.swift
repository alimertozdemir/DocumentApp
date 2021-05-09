//
//  Loadable.swift
//  DocumentPreview
//
//  Created by Ali Mert on 9.05.2021.
//

import Foundation


enum Loadable<T> {
    
    case loading
    case loaded(T)
    case failed(T)
    
}
