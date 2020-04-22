//
//  ViewController.swift
//  Example3ds
//
//  Created by Jeferson Nazario on 03/04/20.
//  Copyright © 2020 jnazario.com. All rights reserved.
//

import UIKit
import Braspag3dsSdk

class ViewController: UIViewController {

    @IBOutlet weak var txtAccessToken: UITextField!
    @IBOutlet weak var btnAuthenticate: UIButton!
    @IBOutlet weak var txtResult: UITextView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var braspag3ds: Braspag3dsProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnAuthenticate.addTarget(self, action: #selector(authenticate), for: .touchUpInside)
    }
    
    @objc func authenticate() {
        guard let accessToken = txtAccessToken.text else { return }
        
        loading.startAnimating()
        
        //https://developercielo.github.io/manual/integracao-sdk-ios#passo-1-solicita%C3%A7%C3%A3o-de-token-de-acesso
        braspag3ds = Braspag3ds(accessToken: accessToken, environment: .sandbox)
        
        let order = OrderData(orderNumber: "123456",
                              currencyCode: "986",
                              totalAmount: 1000,
                              paymentMethod: .credit,
                              transactionId: nil,
                              installments: 0,
                              recurrence: false,
                              productCode: .services,
                              countLast24Hours: nil,
                              countLast6Months: nil,
                              countLast1Year: nil,
                              cardAttemptsLast24Hours: nil,
                              marketingOptIn: nil,
                              marketingSource: nil,
                              transactionMode: .mobile,
                              merchantUrl: nil)
        
        let card = CardData(number: "4000000000001091",
                            expirationMonth: "11",
                            expirationYear: "24")
        
        let options = OptionsData()
        
        braspag3ds.authenticate(orderData: order,
                                cardData: card,
                                authOptions: options,
                                billToData: nil,
                                shipToData: nil,
                                cart: nil,
                                deviceData: nil,
                                userData: nil,
                                airlineData: nil,
                                mdd: nil,
                                recurringData: nil,
                                deviceIpAddress: nil) {[weak self] (status, response, error) in
            
            self?.loading.stopAnimating()
            var text = "\(status)\n\n"
            text += "Authentication: \(response?.debugJsonPrint() ?? "nil")\n\n"
            text += "Deu erro: \(error ?? "não")"
            
            self?.txtResult.text = text
        }
    }

}

extension Encodable {
    func debugJsonPrint() -> String {
        let jsonEncoder = JSONEncoder()
        guard let jsonData = try? jsonEncoder.encode(self) else { return "" }
        
        return String(data: jsonData, encoding: String.Encoding.utf8) ?? ""
    }
}
