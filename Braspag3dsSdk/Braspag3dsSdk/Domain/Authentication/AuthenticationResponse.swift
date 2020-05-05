//
//  AuthenticationResponse.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 12/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public class AuthenticationResponse: Codable {
    var cavv: String?
    var xId: String?
    var eci: String?
    var version: String?
    var referenceId: String?
    var returnCode: String?
    var returnMessage: String?
    
    init(cavv: String? = nil,
         xId: String? = nil,
         eci: String? = nil,
         version: String? = nil,
         referenceId: String? = nil,
         returnCode: String? = nil,
         returnMessage: String? = nil) {
        
        self.cavv = cavv
        self.xId = xId
        self.eci = eci
        self.version = version
        self.referenceId = referenceId
        self.returnCode = returnCode
        self.returnMessage = returnMessage
    }
}
