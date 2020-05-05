//
//  ResponseJwt.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 12/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import Foundation

class ResponseJwt: Codable {
    var token, referenceId: String
    
    init(token: String, referenceId: String) {
        self.token = token
        self.referenceId = referenceId
    }
    
    static func getCurrentJwtToken() -> String? {
        return UserDefaults.standard.string(forKey: ResponseOauthToken.Keys.jwtToken)
    }
    
    func save() {
        UserDefaults.standard.set(token, forKey: ResponseOauthToken.Keys.jwtToken)
    }
}
