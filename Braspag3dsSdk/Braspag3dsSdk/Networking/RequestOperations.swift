//
//  RequestGet.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 07/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import Foundation

struct RequestGet {
    /// Identifier to use query or route format on the request
    static var isQuery: Bool = true // Get this information from a .plist file
    
    /// Get function: to generate a request for the endpoint structured as QUERY or ROUTE params
    ///
    /// - Parameters:
    ///   - url: Url address for the API endpoint
    ///          If the type of params is ROUTE the URL must be generated as we can see below:
    ///          ---> http://mydomain.com/api/endpoint/{0}/detail/{1}
    ///          So, the route will be updated according the sequence of params sent
    ///   - queryParams: *Optional - all parameters used on the query string on the API endpoint
    /// - Returns: URLRequest object
    static func build(_ url: String, with queryParams: [String: Any]?, or routeParams: [String]?) -> URLRequest? {
        var fullUrl: String = url
        if let query = queryParams, isQuery {
            fullUrl += buildQueryString(with: query)
        } else {
            fullUrl += "/"
            if let params = routeParams {
                for (index, param) in params.enumerated() {
                    fullUrl = fullUrl.replacingOccurrences(of: "{\(index)}", with: "\(param)/")
                }
            }
        }
        
        guard let urlRequest: URL = URL(string: fullUrl) else { return nil }
        var request: URLRequest = URLRequest(url: urlRequest)
        request.httpMethod = "GET"
        
        return request
    }
    
    fileprivate static func buildQueryString(with queryParams: [String: Any]) -> String {
        var fullUrl: String = "?"
        queryParams.forEach { (key, value) in
            fullUrl += "\(key)=\(value)&"
        }
        
        fullUrl = String(fullUrl.prefix(fullUrl.count - 2))
        return fullUrl
    }
}

struct RequestPost {
    /// Post function: makes a post on the API endpoint parsing body params
    ///
    /// - Parameters:
    ///   - url: Url address for the API endpoint
    ///   - bodyParams: *Optional - all parameters used on the body on the API endpoint
    /// - Returns: URLRequest object
    static func create(_ url: String,
                       with bodyParams: [String: Any?]?,
                       authenticationType: String = "Bearer") -> URLRequest? {
        
        guard let urlRequest: URL = URL(string: url) else { return nil }
        var request: URLRequest = URLRequest(url: urlRequest)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let params = bodyParams else { return nil }
        
        let onlyValues = params.filter { (_, value) -> Bool in
            return value != nil
        }
        
        guard let postData = try? JSONSerialization.data(withJSONObject: onlyValues, options: []) else { return nil }
        
        request.httpBody = postData as Data
        
        let token = authenticationType == AuthorizationType.basic.rawValue
            ? UserDefaults.standard.string(forKey: ResponseOauthToken.Keys.basicToken) ?? ""
            : BasicToken.getCurrentToken() ?? ""
        
            //UserDefaults.standard.string(forKey: ResponseOauthToken.Keys.braspagToken) ?? ""
        
        request.setValue("\(authenticationType) \(token)", forHTTPHeaderField: "Authorization")
        
        return request
    }
}
