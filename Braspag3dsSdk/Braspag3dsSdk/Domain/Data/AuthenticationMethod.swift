//
//  AuthenticationMethod.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 20/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public enum AuthenticationMethod: Int {
    case noAuthentication = 1
    case ownStoreLogin = 2
    case federatedLogin = 3
    case fidoAuthenticator = 4
}
