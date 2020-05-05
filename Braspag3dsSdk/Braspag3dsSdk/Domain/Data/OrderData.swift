//
//  OrderData.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 19/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public class OrderData {
    
    var orderNumber: String
    var currencyCode: String
    var totalAmount: Int64
    var paymentMethod: PaymentMethod
    var transactionId: String?
    var installments: Int?
    var recurrence: Bool?
    var productCode: ProductCode?
    var countLast24Hours: Int?
    var countLast6Months: Int?
    var countLast1Year: Int?
    var cardAttemptsLast24Hours: Int?
    var marketingOptIn: Bool?
    var marketingSource: String?
    var transactionMode: TransactionMode?
    var merchantUrl: String?
    
    public init(orderNumber: String,
                currencyCode: String,
                totalAmount: Int64,
                paymentMethod: PaymentMethod,
                transactionId: String?,
                installments: Int?,
                recurrence: Bool?,
                productCode: ProductCode?,
                countLast24Hours: Int?,
                countLast6Months: Int?,
                countLast1Year: Int?,
                cardAttemptsLast24Hours: Int?,
                marketingOptIn: Bool?,
                marketingSource: String?,
                transactionMode: TransactionMode?,
                merchantUrl: String?) {
        
        self.orderNumber = orderNumber
        self.currencyCode = currencyCode
        self.totalAmount = totalAmount
        self.paymentMethod = paymentMethod
        self.transactionId = transactionId
        self.installments = installments
        
        self.recurrence = recurrence
        self.productCode = productCode
        self.countLast24Hours = countLast24Hours
        self.countLast6Months = countLast6Months
        self.countLast1Year = countLast1Year
        self.cardAttemptsLast24Hours = cardAttemptsLast24Hours
        self.marketingOptIn = marketingOptIn
        self.marketingSource = marketingSource
        self.transactionMode = transactionMode
        self.merchantUrl = merchantUrl
    }
}
