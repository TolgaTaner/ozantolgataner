//
//  Coin.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 19.03.2025.
//

import Foundation

struct Coin: Model {
    let uuid, symbol, name: String
    let color: String?
    let iconURL: String
    let marketCap, price: String
    let listedAt, tier: Int
    let change: String
    let rank: Int
    let sparkline: [String]
    let lowVolume: Bool
    let coinrankingURL: String
    let the24HVolume, btcPrice: String
    var formattedPrice: String {
        if let numberValue = price.numberValue,
           let formattedPrice = Self.priceFormatter.string(from: numberValue) {
            return formattedPrice
        }
        return price
    }
    var formattedChange: String {
        if let numberValue = change.numberValue,
           let formattedChange = Self.percentageFormatter.string(from: numberValue) {
            return "\(formattedChange)%"
        }
        return change
    }
    
    var formattedHigh: String {
        if let numberValue = sparkline.first?.numberValue,
           let formattedHigh = Self.highLowFormatter.string(from: numberValue) {
            return formattedHigh
        }
        return change
    }
    
    var formattedLow: String {
        if let numberValue = sparkline.last?.numberValue,
           let formattedLow = Self.highLowFormatter.string(from: numberValue) {
            return formattedLow
        }
        return change
    }
    
    var changeInPrice: String {
        if let priceInDouble = price.numberValue?.doubleValue,
           let changeInDouble = change.numberValue?.doubleValue {
            let calculatedPrice = priceInDouble * changeInDouble / 100.0
            let formattedPrice = Self.changesFormatter.string(for: calculatedPrice)
            return "(" + (formattedPrice ?? "-") + ")"
        }
        return "-"
    }
    
    enum CodingKeys: String, CodingKey {
        case uuid, symbol, name, color
        case iconURL = "iconUrl"
        case marketCap, price, listedAt, tier, change, rank, sparkline, lowVolume
        case coinrankingURL = "coinrankingUrl"
        case the24HVolume = "24hVolume"
        case btcPrice
    }
    
    private static var priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.groupingSeparator = ","
        formatter.decimalSeparator = "."
        formatter.currencySymbol = "$"
        return formatter
    }()
    
    private static var highLowFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.groupingSeparator = ","
        formatter.decimalSeparator = "."
        return formatter
    }()
    
    private static var percentageFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.decimalSeparator = "."
        numberFormatter.groupingSeparator = "."
        return numberFormatter
    }()
    
    private static var changesFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = "."
        formatter.currencySymbol = "$"
        return formatter
    }()
}
