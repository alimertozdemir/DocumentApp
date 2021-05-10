//
//  Endpoint.swift
//  DocumentPreview
//
//  Created by Ali Mert on 10.05.2021.
//

import Foundation

public typealias HTTPHeaders = [String:String]

public let BASE_URL = "https://run.mocky.io"

enum HTTPMethod: String {
    
    case get        = "GET"
    case post       = "POST"
    case put        = "PUT"
    case delete     = "DELETE"
    case patch      = "PATCH"
    case head       = "HEAD"
    case trace      = "TRACE"
    case connect    = "CONNECT"
    case options    = "OPTIONS"
    
}

public struct Endpoint {
    var path: String?
    var httpMethod: HTTPMethod
    var headers: HTTPHeaders?
    var body: Data?
    var queryItems: [URLQueryItem]?
}

extension Endpoint {
    
    var urlComponents: URLComponents {
        var component = URLComponents(string: BASE_URL)!
        if let path = path { component.path = path }
        if let queryItems = queryItems { component.queryItems = queryItems }
        return component
    }
        
    var request: URLRequest {
        var request = URLRequest(url: urlComponents.url!)
        print("URL Request: \(String(describing: request.url?.absoluteString))")
        request.httpMethod  = httpMethod.rawValue
        request.httpBody    = body
        if let headers = headers {
            for(headerField, headerValue) in headers {
                request.setValue(headerValue, forHTTPHeaderField: headerField)
            }
        }
        request.httpShouldHandleCookies = true
        return request
    }
    
}
