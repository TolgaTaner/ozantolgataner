//
//  StringExtension.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 20.03.2025.
//

import Foundation

extension String {
    
    var numberValue: NSNumber? {
        if let intValue = Double(self) {
            let number = NSNumber(value: intValue)
            return number
        }
        return nil
    }
}
