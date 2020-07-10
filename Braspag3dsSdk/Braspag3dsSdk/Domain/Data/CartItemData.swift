//
//  CartIte.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 12/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public class CartItemData: SdkObject, Codable {
    var name, description, sku: String?
    var quantity, unitPrice: Double?
    
    public init(name: String?, description: String?, sku: String?, quantity: Double?, price: Double?) {
        self.name = name
        self.description = description
        self.sku = sku
        self.quantity = quantity
        self.unitPrice = price
    }
}
