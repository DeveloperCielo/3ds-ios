//
//  ResponseEnroll.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 12/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

class ResponseEnroll: Codable {
    var cardBrand: Int
    var vEResEnrolled: String?
    var acsUrl: String?
    var pareq: String?
    var authenticationTransactionId: String?
    var messageCategory: String
    var version: String?
    var status: EnrollStatus?
    var returnCode: String
    var returnMessage: String
    var authentication: EnrollAuthentication?
    
    init(cardBrand: Int,
         vEResEnrolled: String?,
         acsUrl: String?,
         pareq: String?,
         authenticationTransactionId: String?,
         messageCategory: String,
         version: String?,
         status: EnrollStatus?,
         returnCode: String,
         returnMessage: String,
         enrollAuthentication: EnrollAuthentication?) {
        
        self.cardBrand = cardBrand
        self.vEResEnrolled = vEResEnrolled
        self.acsUrl = acsUrl
        self.pareq = pareq
        self.authenticationTransactionId = authenticationTransactionId
        self.messageCategory = messageCategory
        self.version = version
        self.status = status
        self.returnCode = returnCode
        self.returnMessage = returnMessage
        self.authentication = enrollAuthentication
    }
}
