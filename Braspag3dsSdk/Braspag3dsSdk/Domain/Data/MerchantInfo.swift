//
//  MerchantInfo.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 19/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public class MerchantInfo {
    var accessToken: String
    var establishmentCode: String
    var merchantName: String
    var mcc: String
    
    public init(accessToken: String,
                establishmentCode: String,
                merchantName: String,
                mcc: String) {
        
        self.accessToken = accessToken
        self.establishmentCode = establishmentCode
        self.merchantName = merchantName
        self.mcc = mcc
    }
}
