//
//  AuthToken.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 07/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import Foundation

public class ResponseOauthToken: Codable {
    public var accessToken: String!
    var tokenType: String!
    var expiresIn: Int!
    
    init(accessToken: String, tokenType: String, expiresIn: Int) {
        self.accessToken = accessToken
        self.tokenType = tokenType
        self.expiresIn = expiresIn
    }
    
    static func getCurrentAccessToken() -> String? {
        return UserDefaults.standard.string(forKey: ResponseOauthToken.Keys.braspagToken)
    }
    
    func save() {
        UserDefaults.standard.set(accessToken, forKey: ResponseOauthToken.Keys.braspagToken)
    }
}

extension ResponseOauthToken {
    struct Keys {
        static let braspagToken = "BraspagToken"
        static let braspagInitNotification = Notification.Name("BraspagInitNotification")
        static let basicToken = "BraspagBasicToken"
        static let jwtToken = "BraspagJwtToken"
    }
}
