//
//  TransactionMode.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 20/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public enum TransactionMode: String, Encodable {
    case moto = "M"
    case retail = "R"
    case eCommerce = "S"
    case mobile = "P"
    case tablet = "T"
}
