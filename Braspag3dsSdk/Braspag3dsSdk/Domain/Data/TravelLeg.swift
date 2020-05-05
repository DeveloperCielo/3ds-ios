//
//  TravelLeg.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 12/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public class TravelLeg: Codable {
    var carrier: String?
    var departureDate: String?
    var origin: String?
    var destination: String?
    
    init(carrier: String?, departureDate: String?, origin: String?, destination: String?) {
        self.carrier = carrier
        self.departureDate = departureDate
        self.origin = origin
        self.destination = destination
    }
}
