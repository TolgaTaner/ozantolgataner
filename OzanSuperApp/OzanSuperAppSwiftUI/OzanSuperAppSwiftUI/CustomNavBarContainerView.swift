//
//  CustomNavBarContainerView.swift
//  OzanSuperAppSwiftUI
//
//  Created by Tolga Taner on 26.03.2025.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            CustomNavBarView(showsBackButton: false, title: "Ranking List", subTitle: "Test")
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
