//
//  UserData.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 20/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public class UserData {
    var guest: Bool?
    var createdDate: String?
    var changedDate: String?
    var passwordChangedDate: String?
    var authenticationMethod: AuthenticationMethod?
    var authenticationProtocol: String?
    var authenticationTimestamp: String?
    var newCustomer: Bool?
    
    public init(guest: Bool?,
                createdDate: String?,
                changedDate: String?,
                passwordChangedDate: String?,
                authenticationMethod: AuthenticationMethod?,
                authenticationProtocol: String?,
                authenticationTimestamp: String?,
                newCustomer: Bool?) {
        
        self.guest = guest
        self.createdDate = createdDate
        self.changedDate = changedDate
        self.passwordChangedDate = passwordChangedDate
        self.authenticationMethod = authenticationMethod
        self.authenticationProtocol = authenticationProtocol
        self.authenticationTimestamp = authenticationTimestamp
        self.newCustomer = newCustomer
    }
}
