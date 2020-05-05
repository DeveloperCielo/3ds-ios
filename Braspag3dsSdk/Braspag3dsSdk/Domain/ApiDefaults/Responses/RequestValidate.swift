//
//  RequestValidate.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 16/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

class RequestValidate: Codable {
    var orderNumber: String
    var currency: String
    var totalAmount: Int64?
    var paymentMethod: String?
    var cardNumber: String
    var cardExpirationMonth: String
    var cardExpirationYear: String
    var authNotifyOnly: Bool?
    var authSuppressChallenge: Bool?
    var transactionId: String
    
    init(orderNumber: String,
         currency: String,
         totalAmount: Int64?,
         paymentMethod: String?,
         cardNumber: String,
         cardExpirationMonth: String,
         cardExpirationYear: String,
         authNotifyOnly: Bool?,
         authSuppressChallenge: Bool?,
         transactionId: String) {

        self.orderNumber = orderNumber
        self.currency = currency
        self.totalAmount = totalAmount
        self.paymentMethod = paymentMethod
        self.cardNumber = cardNumber
        self.cardExpirationMonth = cardExpirationMonth
        self.cardExpirationYear = cardExpirationYear
        self.authNotifyOnly = authNotifyOnly
        self.authSuppressChallenge = authSuppressChallenge
        self.transactionId = transactionId
    }
}
