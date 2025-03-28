//
//  CustomNavLink.swift
//  OzanSuperAppSwiftUI
//
//  Created by Tolga Taner on 26.03.2025.
//

import SwiftUI

struct CustomNavLink<Label: View, Destination: View>: View {
    
    let destination: Destination
    let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink {
            destination
        } label: {
            label
        }
    }
}

#Preview {
    CustomNavView {
        CustomNavLink(destination: Text("test")) {
            Text("click me")
        }
    }
}
