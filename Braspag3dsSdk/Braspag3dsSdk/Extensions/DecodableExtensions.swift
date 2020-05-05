//
//  DecodableExtensions.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 17/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import Foundation

extension JSONDecoder.KeyDecodingStrategy {
    
    static var convertFromUpperCamelCase: JSONDecoder.KeyDecodingStrategy {
        return .custom { codingKeys in
            
            var key = AnyCodingKey(codingKeys.last!)
            
            // lowercase first letter
            if let firstChar = key.stringValue.first {
                let i = key.stringValue.startIndex // swiftlint:disable:this identifier_name
                key.stringValue.replaceSubrange(
                    i ... i, with: String(firstChar).lowercased()
                )
            }
            return key
        }
    }
}

// wrapper to allow us to substitute our mapped string keys.
struct AnyCodingKey: CodingKey {
    
    var stringValue: String
    var intValue: Int?
    
    init(_ base: CodingKey) {
        self.init(stringValue: base.stringValue, intValue: base.intValue)
    }
    
    init(stringValue: String) {
        self.stringValue = stringValue
    }
    
    init(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }
    
    init(stringValue: String, intValue: Int?) {
        self.stringValue = stringValue
        self.intValue = intValue
    }
}
