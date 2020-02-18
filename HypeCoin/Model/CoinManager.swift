//
//  CoinManager.swift
//  HypeCoin
//
//  Created by Darren Rambaud on 02/17/2020.
//  Copyright © 2020 Darren Rambaud. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE" // !!! DO NOT COMMIT THE API KEY TO THE REPOSITORY !!!
    
    let currencies = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getPrice(for currency: String) {
        print(currency)
    }
    
    func getCurrency(nth: Int) -> String {
        return nth >= 0 && nth < currencies.count ? currencies[nth] : "USD"
    }
}
