//
//  CardData.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 19/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public class CardData: Encodable {
    var number, expirationMonth, expirationYear: String
    var cardAlias: String?
    var defaultCard: Bool?
    
    public init(number: String,
                expirationMonth: String,
                expirationYear: String,
                cardAlias: String?,
                defaultCard: Bool?) {
        self.number = number
        self.expirationMonth = expirationMonth
        self.expirationYear = expirationYear
        self.cardAlias = cardAlias
        self.defaultCard = defaultCard
    }
}
