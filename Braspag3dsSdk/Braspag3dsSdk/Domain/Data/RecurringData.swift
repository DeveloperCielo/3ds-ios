//
//  RecurringData.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 20/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public class RecurringData {
    var endDate: String?
    var frequency: RecurringFrequency?
    var originalPurchaseDate: String?
    
    public init(endDate: String?,
                frequency: RecurringFrequency?,
                originalPurchaseDate: String?) {
        
        self.endDate = endDate
        self.frequency = frequency
        self.originalPurchaseDate = originalPurchaseDate
    }
}
