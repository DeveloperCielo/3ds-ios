//
//  AuthTokenParams.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 07/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import CardinalMobile

public protocol Braspag3dsProtocol {
    // swiftlint:disable:next function_parameter_count
    func authenticate(orderData: OrderData,
                      cardData: CardData,
                      authOptions: OptionsData?,
                      billToData: BillToData?,
                      shipToData: ShipToData?,
                      cart: [CartItemData]?,
                      deviceData: [DeviceData]?,
                      userData: UserData?,
                      airlineData: AirlineData?,
                      mdd: MddData?,
                      recurringData: RecurringData?,
                      deviceIpAddress: String?,
                      completion: @escaping (CallbackStatus, AuthenticationResponse?, String?) -> Void)
}

public class Braspag3ds: Braspag3dsProtocol {
    
    let environment: Environment
    
    let apiSdk: BraspagApiProtocol
    
    fileprivate var enrollResponse: ResponseEnroll!
    fileprivate var enrollData: EnrollData!
    fileprivate var session: CardinalSession!
    
    fileprivate var onCompletion: ((CallbackStatus, AuthenticationResponse?, String?) -> Void)!
    
    public init(accessToken: String,
                environment: Environment = .production,
                customUi: BraspagCustomUi? = nil) {
        
        let basicAuth = BasicToken(accessToken: accessToken)
        basicAuth.save()

        apiSdk = BraspagApi(environment: environment)
        self.environment = environment
        
        configureBasicToken()
        configureCardinalSession(customUi: customUi)
    }
    
    public func authenticate(orderData: OrderData,
                             cardData: CardData,
                             authOptions: OptionsData?,
                             billToData: BillToData? = nil,
                             shipToData: ShipToData? = nil,
                             cart: [CartItemData]? = nil,
                             deviceData: [DeviceData]? = nil,
                             userData: UserData? = nil,
                             airlineData: AirlineData? = nil,
                             mdd: MddData? = nil,
                             recurringData: RecurringData? = nil,
                             deviceIpAddress: String? = nil,
                             completion: @escaping (CallbackStatus, AuthenticationResponse?, String?) -> Void) {
        
        self.enrollData = EnrollData(orderData: orderData,
                                     cardData: cardData,
                                     authOptions: authOptions,
                                     billToData: billToData,
                                     shipToData: shipToData,
                                     cart: cart,
                                     deviceData: deviceData,
                                     userData: userData,
                                     airlineData: airlineData,
                                     mdd: mdd,
                                     recurringData: recurringData,
                                     deviceIpAddress: deviceIpAddress)
        
        onCompletion = completion
        
        self.braspagInitJwt(orderData.orderNumber,
                            orderData.currencyCode,
                            orderData.totalAmount,
                            completion: {[weak self] (success, error) in
            guard success else {
                self?.onCompletion(CallbackStatus.error, nil, "/init failed: \(error ?? "")")
                return
            }
            
            self?.sessionSetup(cardData.number, completion: {[weak self] (success) in
                guard success else {
                    self?.onCompletion(CallbackStatus.error, nil, "session setup failed")
                    return
                }
                
                guard let enroll = self?.enrollData else {
                    self?.onCompletion(CallbackStatus.error, nil, "enroll data is nil")
                    return
                }
                
                self?.braspagEnroll(enroll, completion: {[weak self] status, authentication, error  in
                    guard let strongSelf = self, error == nil else {
                        let auth = authentication != nil ? authentication?.toAuthResponse() : nil
                        self?.onCompletion(CallbackStatus.error, auth, error)
                        return
                    }
                    
                    strongSelf.processEnroll(status, strongSelf, authentication)
                })
            })
        })
    }
    
    private func braspagInitJwt(_ orderNumber: String,
                                _ currency: String,
                                _ amount: Int64,
                                completion: @escaping (Bool, String?) -> Void) {
        let request = RequestOrder(orderNumber: orderNumber, currency: currency, amount: amount)
        apiSdk.getJwt(request: request) { (token, error) in
            guard error == nil else {
                completion(false, error)
                return
            }
            
            guard let jwtToken = token else {
                completion(false, nil)
                return
            }
            
            jwtToken.save()
            completion(true, nil)
        }
    }
    
    private func braspagEnroll(_ enrollData: EnrollData,
                               completion: @escaping (EnrollStatus, EnrollAuthentication?, String?) -> Void) {
        apiSdk.enroll(request: enrollData) {[weak self] (response, error) in
            guard error == nil else {
                completion(.error, nil, error)
                return
            }
            
            guard let enroll = response else {
                completion(.error, nil, nil)
                return
            }
            
            self?.enrollResponse = enroll
            completion(enroll.status ?? .error, enroll.authentication, nil)
        }
    }
    
    private func braspagValidate(completion: @escaping (Bool, String?) -> Void) {
        let request = RequestValidate(orderNumber: enrollData.orderNumber,
                                      currency: enrollData.currency,
                                      totalAmount: enrollData.totalAmount,
                                      paymentMethod: enrollData.paymentMethod,
                                      cardNumber: enrollData.cardNumber,
                                      cardExpirationMonth: enrollData.cardExpirationMonth,
                                      cardExpirationYear: enrollData.cardExpirationYear,
                                      authNotifyOnly: enrollData.authNotifyOnly,
                                      authSuppressChallenge: enrollData.authSuppressChallenge,
                                      transactionId: enrollResponse.authenticationTransactionId ?? "")
        apiSdk.validate(request: request) { (validateResponse, error) in
            guard error == nil else {
                completion(false, error)
                return
            }

            guard let response = validateResponse else {
                completion(false, nil)
                return
            }
            
            completion(response.status == AuthenticationStatus.authenticated.rawValue, nil)
        }
    }
    
    fileprivate func processEnroll(_ status: EnrollStatus,
                                   _ strongSelf: Braspag3ds,
                                   _ authentication: EnrollAuthentication?) {
        if status == .enrolled {
            strongSelf.session
                .continueWith(transactionId: strongSelf.enrollResponse.authenticationTransactionId ?? "",
                              payload: strongSelf.enrollResponse.pareq ?? "",
                              validationDelegate: strongSelf)
            return
        }
        
        if status == .authenticationCheckNeeded {
            strongSelf.checkAuthentication()
            return
        }
        
        var callbackStatus = CallbackStatus.error
        guard let auth = authentication else {
            self.onCompletion(CallbackStatus.error, nil, "authentication is nil")
            return
        }
        
        switch status {
        case .validationNeeded:
            strongSelf.braspagValidate(completion: {[weak self] (success, error) in
                guard success else {
                    self?.onCompletion(CallbackStatus.error, nil, "validate failed: \(error ?? "")")
                    return
                }
                
                self?.onCompletion(CallbackStatus.success, auth.toAuthResponse(), nil)
                return
            })
            
        case .notEnrolled: callbackStatus = .unenrolled
        case .failed: callbackStatus = .failure
        case .unsupportedBrand: callbackStatus = .unsupportedBrand
        default: callbackStatus = .error
        }
        
        self.onCompletion(callbackStatus, auth.toAuthResponse(), nil)
    }
    
    private func sessionSetup(_ cardNumber: String, completion: @escaping (Bool) -> Void) {
        guard let jwt = ResponseJwt.getCurrentJwtToken() else {
            completion(false)
            return
        }

        session.setup(jwtString: jwt, account: cardNumber, completed: { consumerId in
            print("ConsumerID: \(consumerId)")
            completion(true)
        }) { (validateResponse) in // swiftlint:disable:this multiple_closures_with_trailing_closure
            NSLog("%@", validateResponse)
            completion(false)
        }
    }
    
    private func configureBasicToken() {
        
    }
    
    private func configureCardinalSession(customUi: BraspagCustomUi?) {
        session = CardinalSession()
        let config = CardinalSessionConfiguration()

        switch environment {
        case .production:
            config.deploymentEnvironment = .production
        case .sandbox:
            config.deploymentEnvironment = .staging
        }

        config.deploymentEnvironment = .staging
        config.uiType = .both

        if let yourCustomUi = customUi {
            config.uiCustomization = yourCustomUi
        }

        config.renderType = [CardinalSessionRenderTypeOTP,
                             CardinalSessionRenderTypeHTML]
        config.enableDFSync = true
        session.configure(config)
    }
    
    private func checkAuthentication() {
        let auth = enrollResponse.authentication
        guard let status = auth?.status else {
            onCompletion(CallbackStatus.error, nil, "checkAuthentication auth is nil")
            return
        }
        
        switch status {
        case .authenticated:
            onCompletion(CallbackStatus.success, auth?.toAuthResponse(), nil)
            
        case .unavailable:
            onCompletion(CallbackStatus.failure, auth?.toAuthResponse(), auth?.authenticationStatusMessage)
            
        case .failed:
            onCompletion(CallbackStatus.failure, auth?.toAuthResponse(), auth?.authenticationStatusMessage)
            
        default:
            onCompletion(CallbackStatus.failure, auth?.toAuthResponse(), nil)
        }
    }
}

extension Braspag3ds: CardinalValidationDelegate {
    public func cardinalSession(cardinalSession session: CardinalSession!,
                                stepUpValidated validateResponse: CardinalResponse!,
                                serverJWT: String!) {

        switch validateResponse.actionCode {
        case .timeout: break
            
        case .success, .noAction, .failure:
            
            braspagValidate {[weak self] (success, error) in
                guard success else {
                    self?.onCompletion(CallbackStatus.error, nil, "validte failed: \(error ?? "")")
                    return
                }
                let auth = self?.enrollResponse.authentication?.toAuthResponse()
                self?.onCompletion(CallbackStatus.success, auth, nil)
            }
            
        case .error:
            let auth = enrollResponse.authentication?.toAuthResponse()
            print("EnrollResponse:\n\(enrollResponse.debugJsonPrint())")
            print(auth.debugJsonPrint())
            onCompletion(CallbackStatus.error, auth, validateResponse.errorDescription)
            
        case .cancel:
            onCompletion(CallbackStatus.error, nil, "validateResponse.validationCode = cancel")
            
        @unknown default:
            onCompletion(CallbackStatus.error, nil, "validateResponse.validationCode default error")
        }
    }
}
