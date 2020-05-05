//
//  BraspagApi.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 11/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

protocol BraspagApiProtocol {
    func getOauth(request: RequestOauth,
                  completion: @escaping (_ authToken: ResponseOauthToken?, _ oauthToken: String?) -> Void)
    
    func getJwt(request: RequestOrder,
                completion: @escaping (_ jwtResponse: ResponseJwt?, _ jwtString: String?) -> Void)
    
    func enroll(request: EnrollData,
                completion: @escaping (_ enrollResponse: ResponseEnroll?, _ error: String?) -> Void)
    
    func validate(request: RequestValidate,
                  completion: @escaping (_ validateResponse: ResponseValidate?, _ error: String?) -> Void)
}

class BraspagApi: BraspagApiProtocol {
    let client: BraspagApiClient!
    
    init(environment: Environment = .production) {
        client = BraspagApiClient(environment: environment)
    }
    
    func getOauth(request: RequestOauth,
                  completion: @escaping (ResponseOauthToken?, String?) -> Void) {
        Api.shared.request(url: client.authToken(),
                           method: RequestType.POST,
                           with: request.toDict(),
                           authenticationType: AuthorizationType.basic.rawValue,
                           completion: completion)
    }
    
    func getJwt(request: RequestOrder,
                completion: @escaping (ResponseJwt?, String?) -> Void) {
        Api.shared.request(url: client.initJwt(),
                           method: RequestType.POST,
                           with: request.toDict(),
                           completion: completion)
    }
    
    func enroll(request: EnrollData,
                completion: @escaping (ResponseEnroll?, String?) -> Void) {
        Api.shared.request(url: client.enroll(),
                           method: RequestType.POST,
                           with: request.toDict(),
                           completion: completion)
    }
    
    func validate(request: RequestValidate,
                  completion: @escaping (_ validateResponse: ResponseValidate?, _ error: String?) -> Void) {
        Api.shared.request(url: client.validate(),
                           method: RequestType.POST,
                           with: request.toDict(),
                           completion: completion)
    }
}
