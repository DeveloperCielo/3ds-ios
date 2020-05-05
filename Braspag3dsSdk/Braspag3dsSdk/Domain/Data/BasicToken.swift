//
//  BasicToken.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 19/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import Foundation

class BasicToken {
    var token: String
    
    init(accessToken: String) {
        token = accessToken
    }
    
    static func getCurrentToken() -> String? {
        return UserDefaults.standard.string(forKey: ResponseOauthToken.Keys.braspagToken)
    }
    
    func save() {
        UserDefaults.standard.set(token, forKey: ResponseOauthToken.Keys.braspagToken)
    }
}
