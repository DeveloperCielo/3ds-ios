//
//  ApiProtocol.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 07/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import Foundation

protocol ApiProtocol {
    func request<T: Decodable>(url: String,
                               method: RequestType,
                               with parameters: [String: Any]?,
                               authenticationType: String,
                               completion: @escaping (T?, String?) -> Void)
}

class Api: ApiProtocol {
    
    static var shared: Api = {
       return Api()
    }()
    
    func request<T: Decodable>(url: String,
                               method: RequestType,
                               with parameters: [String: Any]?,
                               authenticationType: String = AuthorizationType.bearer.rawValue,
                               completion: @escaping (T?, String?) -> Void) {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        var urlRequest: URLRequest?
        switch method {
        case .GET:
            urlRequest = RequestGet.build(url, with: parameters, or: nil)
        case .POST:
            urlRequest = RequestPost.create(url, with: parameters, authenticationType: authenticationType)
        case .PUT: break
        case .DELETE: break
        }
        
        if let myRequest = urlRequest {
            let task = session.dataTask(with: myRequest, completionHandler: { (result, _, error) in
                
                #if DEBUG
                print("Result:\n\(String(data: result ?? Data(), encoding: .utf8) ?? "sem result")")
                #endif
                
                guard error == nil else {
                    completion(nil, "request error: " + error!.localizedDescription)
                    return
                }
                guard let data = result else {
                    completion(nil, "Nenhum dado retornado")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromUpperCamelCase
                    if authenticationType == AuthorizationType.basic.rawValue {
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                    }
                    
                    let decodableData: T = try decoder.decode(T.self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(decodableData, nil)
                    }
                } catch let exception {
                    print("Exception: \(exception)")
                    let resultString = String(data: data, encoding: .utf8) ?? "empty data"
                    completion(nil, "decode error: " + exception.localizedDescription + "\nResult: \(resultString)")
                }
            })
            
            task.resume()
        } else {
            completion(nil, "Não foi possível executar a chamada à API")
        }
    }
}
