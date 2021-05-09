//
//  LiveData.swift
//  DocumentPreview
//
//  Created by Ali Mert on 9.05.2021.
//

import Foundation

class LiveData<T> {
    
    typealias Listener = (T) -> Void
    
    var listener: Listener?

    var value: T? {
        didSet {
            if let value = value {
                listener?(value)
            }
        }
    }
    
    init(_ value: T? = nil) {
        self.value = value
    }
    
    func observe(listener: Listener?) {
        self.listener = listener
        if let value = value {
            listener?(value)
        }
        
    }
}
