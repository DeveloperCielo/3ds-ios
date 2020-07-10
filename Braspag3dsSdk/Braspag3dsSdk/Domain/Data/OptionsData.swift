//
//  OptionsData.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 19/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public class OptionsData: Encodable {
    var notifyOnly: Bool = false
    var suppressChallenge: Bool = false
    
    public init(notifyOnly: Bool? = false, suppressChallenge: Bool? = false) {
        self.notifyOnly = notifyOnly ?? false
        self.suppressChallenge = suppressChallenge ?? false
    }
}
