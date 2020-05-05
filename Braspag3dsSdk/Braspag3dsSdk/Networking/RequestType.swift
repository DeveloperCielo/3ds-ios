//
//  RequestType.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 07/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

enum RequestType: String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum AuthorizationType: String {
    case basic = "Basic"
    case bearer = "Bearer"
}

enum TokensDefault: String {
    // swiftlint:disable:next line_length
    case basic = "ZGJhM2E4ZGItZmE1NC00MGUwLThiYWItN2JmYjliNmYyZTJlOkQvaWxSc2ZvcUhsU1VDaHdBTW5seUtkRE5kN0ZNc003Y1Uvdm8wMlJFYWc9"
}
