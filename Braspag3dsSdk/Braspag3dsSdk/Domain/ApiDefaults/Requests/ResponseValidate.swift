//
//  ResponseValidate.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 16/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

class ResponseValidate: Codable {
    var directoryServerTransactionId: String?
    var xid: String
    var eci: String
    var eciRaw: String
    var cavv: String
    var paresStatus: String
    var authenticationResult: String
    var authenticationStatusMessage: String
    var version: String
    var status: String
    var returnCode: String
    var returnMessage: String
    
    init(directoryServerTransactionId: String,
         xId: String,
         eci: String,
         eciRaw: String,
         cavv: String,
         paresStatus: String,
         authenticationResult: String,
         authenticationStatusMessage: String,
         version: String,
         status: String,
         returnCode: String,
         returnMessage: String) {
        
        self.directoryServerTransactionId = directoryServerTransactionId
        self.xid = xId
        self.eci = eci
        self.eciRaw = eciRaw
        self.cavv = cavv
        self.paresStatus = paresStatus
        self.authenticationResult = authenticationResult
        self.authenticationStatusMessage = authenticationStatusMessage
        self.version = version
        self.status = status
        self.returnCode = returnCode
        self.returnMessage = returnMessage
    }
}
