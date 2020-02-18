//
//  CoinData.swift
//  HypeCoin
//
//  Created by Darren Rambaud on 2/17/20.
//  Copyright © 2020 Darren Rambaud. All rights reserved.
//

import Foundation

struct CoinData: Decodable {
    var time: String
    var asset_id_base: String
    var asset_id_quote: String
    var rate: Double
}

extension Double { // ?? extract to separate file ??
    func toString() -> String {
        return String(format: "%.5f", self)
    }
}
