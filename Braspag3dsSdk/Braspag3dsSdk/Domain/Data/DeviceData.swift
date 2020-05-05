//
//  Device.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 12/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public class DeviceData: Codable {
    var fingerPrint, provider: String
    
    init(fingerPrint: String, provider: String) {
        self.fingerPrint = fingerPrint
        self.provider = provider
    }
}
