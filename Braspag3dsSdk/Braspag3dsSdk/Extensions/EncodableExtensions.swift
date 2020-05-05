//
//  EncodableExtensions.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 11/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import Foundation

extension Encodable {
    func toDict() -> [String: Any] {
        var dict = [String: Any]()
        let otherSelf = Mirror(reflecting: self)
        for child in otherSelf.children {
            if let key = child.label {
                dict[key] = child.value
            }
        }
        return dict
    }
    
    func debugJsonPrint() -> String {
        let jsonEncoder = JSONEncoder()
        guard let jsonData = try? jsonEncoder.encode(self) else { return "" }
        
        return String(data: jsonData, encoding: String.Encoding.utf8) ?? ""
    }
}
