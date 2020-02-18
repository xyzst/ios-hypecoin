//
//  CoinManager.swift
//  HypeCoin
//
//  Created by Darren Rambaud on 02/17/2020.
//  Copyright © 2020 Darren Rambaud. All rights reserved.
//

import UIKit

struct CoinManager {
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "" // !!! DO NOT COMMIT THE API KEY TO THE REPOSITORY !!!
    
    let currencies = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getPrice(for currency: String) {
        if let u = URL(string: "\(baseURL)/\(currency)") {
            let s = URLSession(configuration: .default)
            var r = URLRequest(url: u)
            r.setValue(apiKey, forHTTPHeaderField: "X-CoinAPI-Key")
            let t = s.dataTask(with: r) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWith(error: error!)
                    return
                }
                
                if let d = data {
                    if let c = self.parse(data: d) {
                        self.delegate?.didUpdateWith(data: c)
                    }
                }
            }
            t.resume()
        }
    }
    
    func getCurrency(nth: Int) -> String {
        return nth >= 0 && nth < currencies.count ? currencies[nth] : "USD"
    }
    
    func parse(data: Data) -> CoinData? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(CoinData.self, from: data)
        } catch {
            self.delegate?.didFailWith(error: error)
            return nil
        }
    }
}

protocol CoinManagerDelegate { // ?? refactor to separate file ??
    func didFailWith(error: Error)
    func didUpdateWith(data: CoinData)
}
