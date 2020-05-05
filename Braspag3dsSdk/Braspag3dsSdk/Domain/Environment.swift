//
//  Environment.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 11/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public enum Environment: String {
    case sandbox
    case production
}

extension Environment: Codable {
    public init(from decoder: Decoder) throws {
        self = try Environment(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .production
    }
}
