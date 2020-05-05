//
//  RequestOrder.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 12/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

class RequestOrder: Codable {
    var orderNumber, currency: String
    var amount: Int64
    var objectifyPayload: Bool
    
    init(orderNumber: String, currency: String, amount: Int64) {
        self.orderNumber = orderNumber
        self.currency = currency
        self.amount = amount
        objectifyPayload = true
    }
}
