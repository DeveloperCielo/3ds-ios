//
//  AuthenticationStatus.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 12/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

enum AuthenticationStatus: String, Codable {
    case authenticated = "AUTHENTICATED"
    case unavailable = "UNAVAILABLE"
    case failed = "FAILED"
    case errorOccurred = "ERROR_OCCURRED"
    case unknown = "UNKNOWN"
}
