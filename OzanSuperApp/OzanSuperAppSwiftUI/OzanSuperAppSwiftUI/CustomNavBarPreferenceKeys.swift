//
//  CustomNavBarPreferenceKeys.swift
//  OzanSuperAppSwiftUI
//
//  Created by Tolga Taner on 26.03.2025.
//

import Foundation
import SwiftUI

struct CustomNavBarTitlePreferenceKeys: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct CustomNavBarBackButtonHiddenPreferenceKeys: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View {
    
}
