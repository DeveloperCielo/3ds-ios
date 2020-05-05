//
//  RequestOauth.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 11/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

class RequestOauth: Codable {
    let establishmentCode, merchantName, mcc: String
    
    init(establishmentCode: String, merchantName: String, mcc: String) {
        self.establishmentCode = establishmentCode
        self.merchantName = merchantName
        self.mcc = mcc
    }
}
