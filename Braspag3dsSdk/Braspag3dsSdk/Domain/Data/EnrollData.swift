//
//  EnrollData.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 12/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

class EnrollData: Codable {
    var transactionId: String?
    var transactionMode: String?

    var merchantUrl: String?
    var merchantNewCustomer: Bool?

    var orderNumber: String! // required

    var currency: String! // required

    var totalAmount: Int64?
    var installments: Int?

    var cardNumber: String! // required

    var cardExpirationMonth: String! // required

    var cardExpirationYear: String!  // required

    var cardAlias: String?
    var defaultCard: Bool?

    var paymentMethod: String? = "credit"

    var cardAddedDate: String?

    var billToCustomerId: Int?
    var billToContactName: String?
    var billToPhoneNumber: Int?
    var billToEmail: String?
    var billToStreet1: String?
    var billToStreet2: String?
    var billToCity: String?
    var billToState: String?
    var billToZipCode: String?
    var billToCountry: String?

    var shipToSameAddressAsBillTo: Bool?
    var shipToAddressee: String?
    var shipToPhoneNumber: Int?
    var shipToEmail: String?
    var shipToStreet1: String?
    var shipToStreet2: String?
    var shipToCity: String?
    var shipToState: String?
    var shipToZipCode: String?
    var shipToShippingMethod: ShippingMethod?
    var shipToFirstUsageDate: String?
    var shipToCountry: String?

    var cart: [CartItemData]?

    var deviceIpAddress: String?
    var device: [DeviceData]?

    var orderRecurrence: Bool?
    var orderProductCode: String?
    var orderCountLast24Hours: Int?
    var orderCountLast6Months: Int?
    var orderCountLast1Year: Int?
    var orderCardAttemptsLast24Hours: Int?
    var orderMarketingOptin: Bool?
    var orderMarketSource: String?

    var userAccountGuest: Bool?
    var userAccountCreateDate: String?
    var userAccountChangeDate: String?
    var userAccountPasswordChangedDate: String?
    var userAccountAuthenticationMethod: Int?
    var userAccountAuthenticationProtocol: String?
    var userAccountAuthenticationTimestamp: String?

    var airlineTravelLeg: TravelLeg?
    var airlinePassenger: Passenger?
    var airlineNumberOfPassengers: Int?
    var airlineBillToPassportCountry: String?
    var airlineBillToPassportNumber: String?

    var mdd1: String?
    var mdd2: String?
    var mdd3: String?
    var mdd4: String?
    var mdd5: String?

    var authNotifyOnly: Bool? = false

    var recurringEndDate: String?
    var recurringFrequency: Int?
    var recurringOriginalPurchaseDate: String?

    var authSuppressChallenge: Bool? = false
    
    // swiftlint:disable:next function_body_length
    init(orderData: OrderData,
         cardData: CardData,
         authOptions: OptionsData?,
         billToData: BillToData?,
         shipToData: ShipToData?,
         cart: [CartItemData]?,
         deviceData: [DeviceData]?,
         userData: UserData?,
         airlineData: AirlineData?,
         mdd: MddData?,
         recurringData: RecurringData?,
         deviceIpAddress: String?) {
        
        orderNumber = orderData.orderNumber
        currency = orderData.currencyCode
        cardNumber = cardData.number
        totalAmount = orderData.totalAmount
        installments = orderData.installments
        merchantUrl = orderData.merchantUrl
        paymentMethod = orderData.paymentMethod.rawValue
       
        authNotifyOnly = authOptions?.notifyOnly
        authSuppressChallenge = authOptions?.suppressChallenge
        
        cardExpirationMonth = cardData.expirationMonth
        cardExpirationYear = cardData.expirationYear
        cardAlias = cardData.cardAlias
        defaultCard = cardData.defaultCard
        merchantNewCustomer = userData?.newCustomer
        
        billToCustomerId = billToData?.customerId
        billToContactName = billToData?.contactName
        billToPhoneNumber = billToData?.phoneNumber
        billToEmail = billToData?.email
        billToStreet1 = billToData?.street1
        billToStreet2 = billToData?.street2
        billToCity = billToData?.city
        billToState = billToData?.state
        billToZipCode = billToData?.zipCode
        billToCountry = billToData?.country
        
        shipToSameAddressAsBillTo = shipToData?.sameAsBillTo
        shipToAddressee = shipToData?.addresssee
        shipToPhoneNumber = shipToData?.phoneNumber
        shipToEmail = shipToData?.email
        shipToStreet1 = shipToData?.street1
        shipToStreet2 = shipToData?.street2
        shipToCity = shipToData?.city
        shipToState = shipToData?.state
        shipToZipCode = shipToData?.zipCode
        shipToShippingMethod = shipToData?.shippingMethod
        shipToFirstUsageDate = shipToData?.firstUsageDate
        shipToCountry = shipToData?.country
        
        self.cart = cart
        self.device = deviceData
        
        orderRecurrence = orderData.recurrence
        orderProductCode = orderData.productCode?.rawValue
        orderCountLast24Hours = orderData.countLast24Hours
        orderCountLast6Months = orderData.countLast6Months
        orderCountLast1Year = orderData.countLast1Year
        orderCardAttemptsLast24Hours = orderData.cardAttemptsLast24Hours
        orderMarketingOptin = orderData.marketingOptIn
        orderMarketSource = orderData.marketingSource
        
        userAccountGuest = userData?.guest
        userAccountCreateDate = userData?.createdDate
        userAccountChangeDate = userData?.changedDate
        userAccountPasswordChangedDate = userData?.passwordChangedDate
        userAccountAuthenticationMethod = userData?.authenticationMethod?.rawValue
        userAccountAuthenticationProtocol = userData?.authenticationProtocol
        userAccountAuthenticationTimestamp = userData?.authenticationTimestamp
        
        airlineTravelLeg = airlineData?.travelLeg
        airlinePassenger = airlineData?.passenger
        airlineNumberOfPassengers = airlineData?.numberOfPassengers
        airlineBillToPassportCountry = airlineData?.billToPassportCountry
        airlineBillToPassportNumber = airlineData?.billToPassportNumber
        
        mdd1 = mdd?.mdd1
        mdd2 = mdd?.mdd2
        mdd3 = mdd?.mdd3
        mdd4 = mdd?.mdd4
        mdd5 = mdd?.mdd5
        
        recurringEndDate = recurringData?.endDate
        recurringFrequency = recurringData?.frequency?.rawValue
        recurringOriginalPurchaseDate = recurringData?.originalPurchaseDate
    }
}
