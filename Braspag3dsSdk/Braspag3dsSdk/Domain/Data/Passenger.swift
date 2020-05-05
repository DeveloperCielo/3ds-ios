//
//  Passenger.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 12/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public class Passenger: Codable {
    var name: String?
    var ticketPrice: Double?
    
    init(name: String?, ticketPrice: Double) {
        self.name = name
        self.ticketPrice = ticketPrice
    }
}
