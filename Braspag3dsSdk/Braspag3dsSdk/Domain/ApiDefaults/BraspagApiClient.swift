//
//  ApiEndpoints.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 09/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

class BraspagApiClient {
    private let production: String = "https://mpi.braspag.com.br"
    private let sandbox: String = "https://mpisandbox.braspag.com.br"
//    private let sandbox: String = "https://mpi02.azurewebsites.net"
    private let version: String = "/v2"
    private let authType: String = "/3ds"
    
    let environment: Environment
    
    init(environment: Environment = .production) {
        self.environment = environment
    }
    
    private func base() -> String {
        let baseUrl = environment == .production ? production : sandbox
        
        return baseUrl + version
    }
    
    func authToken() -> String {
        return base() + "/auth/token"
    }
    
    func initJwt() -> String {
        return base() + authType + "/init"
    }
    
    func enroll() -> String {
        return base() + authType + "/enroll"
    }
    
    func validate() -> String {
        return base() + authType + "/validate"
    }
}
