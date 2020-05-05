//
//  BillToData.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 20/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public class BillToData {
    var customerId: Int?
    var contactName: String
    var phoneNumber: Int
    var email: String
    var street1: String
    var street2: String
    var city: String
    var state: String
    var zipCode: String
    var country: String
    
    public init(contactName: String,
                phoneNumber: Int,
                email: String,
                street1: String,
                street2: String,
                city: String,
                state: String,
                zipCode: String,
                country: String = "BR",
                customerId: Int? = nil) {
        
        self.customerId = customerId
        self.contactName = contactName
        self.phoneNumber = phoneNumber
        self.email = email
        self.street1 = street1
        self.street2 = street2
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.country = country
    }
}
