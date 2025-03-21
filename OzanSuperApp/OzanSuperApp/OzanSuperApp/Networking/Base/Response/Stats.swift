//
//  Stats.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 19.03.2025.
//

import Foundation

struct Stats: Model {
    let total, totalCoins, totalMarkets, totalExchanges: Int
    let totalMarketCap, total24HVolume: String

    enum CodingKeys: String, CodingKey {
        case total, totalCoins, totalMarkets, totalExchanges, totalMarketCap
        case total24HVolume = "total24hVolume"
    }
}
