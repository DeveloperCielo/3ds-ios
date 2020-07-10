//
//  AuthenticationMethod.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 20/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public enum AuthenticationMethod: String, Encodable {
    case noAuthentication = "01"
    case ownStoreLogin = "02"
    case federatedLogin = "03"
    case fidoAuthenticator = "04"
}
