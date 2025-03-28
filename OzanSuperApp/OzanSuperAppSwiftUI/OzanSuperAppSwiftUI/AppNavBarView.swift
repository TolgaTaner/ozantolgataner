//
//  CustomNavBar.swift
//  OzanSuperAppSwiftUI
//
//  Created by Tolga Taner on 26.03.2025.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                CustomNavLink(destination: Text("destination")) {
                    Text("Navigate")
                }
            }
        }
    }
}

extension AppNavBarView {
    private var defaultView: some View {
        NavigationView {
            
        }
        .navigationTitle("Nav title here")
    }
}
