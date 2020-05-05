//
//  EnrollStatus.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 12/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

enum EnrollStatus: String, Codable {
    case enrolled = "ENROLLED"
    case validationNeeded = "VALIDATION_NEEDED"
    case authenticationCheckNeeded = "AUTHENTICATION_CHECK_NEEDED"
    case notEnrolled = "NOT_ENROLLED"
    case failed = "FAILED"
    case unsupportedBrand = "UNSUPPORTED_BRAND"
    case error = "ERROR"
    case unknown = "UNKNOWN"
}
