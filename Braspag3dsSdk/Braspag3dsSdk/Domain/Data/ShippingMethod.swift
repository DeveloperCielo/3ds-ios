//
//  ShippingMethod.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 20/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public enum ShippingMethod: String, Codable {
    case lowcost
    case sameday
    case oneday
    case twoday
    case threeday
    case pickup
    case other
}
