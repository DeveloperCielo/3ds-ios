//
//  ShipToData.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 20/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public class ShipToData {
    var sameAsBillTo: Bool?
    var addresssee: String?
    var phoneNumber: Int?
    var email: String?
    var street1: String?
    var street2: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var country: String?
    var shippingMethod: ShippingMethod?
    var firstUsageDate: String?
    
    public init(sameAsToBill: Bool?,
                addresssee: String?,
                phoneNumber: Int?,
                email: String?,
                street1: String?,
                street2: String?,
                city: String?,
                state: String?,
                zipCode: String?,
                country: String? = "BR",
                shippingMethod: ShippingMethod?,
                firstUsageDate: String?) {
        
        self.sameAsBillTo = sameAsToBill
        self.addresssee = addresssee
        self.phoneNumber = phoneNumber
        self.email = email
        self.street1 = street1
        self.street2 = street2
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.country = country
        self.shippingMethod = shippingMethod
        self.firstUsageDate = firstUsageDate
    }
}
