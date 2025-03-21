//
//  DoubleExtension.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 20.03.2025.
//

import Foundation

extension NSNumber {
    var isPositive: Bool {
        doubleValue.sign == .plus
    }
}
