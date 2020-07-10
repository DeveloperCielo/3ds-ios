//
//  AirlineData.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 20/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public class AirlineData: Encodable {
    var numberOfPassengers: Int?
    var billToPassportCountry: String?
    var billToPassportNumber: String?
    var travelLeg: TravelLeg?
    var passenger: Passenger?
    
    public init(numberOfPassengers: Int?,
                billToPassportCountry: String?,
                billToPassportNumber: String?,
                travelLeg: TravelLeg?,
                passenger: Passenger?) {
        
        self.numberOfPassengers = numberOfPassengers
        self.billToPassportNumber = billToPassportNumber
        self.billToPassportCountry = billToPassportCountry
        self.travelLeg = travelLeg
        self.passenger = passenger
    }
}
