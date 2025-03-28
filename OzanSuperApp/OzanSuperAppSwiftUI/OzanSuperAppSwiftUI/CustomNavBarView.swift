//
//  AppNavigationView.swift
//  OzanSuperAppSwiftUI
//
//  Created by Tolga Taner on 25.03.2025.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showsBackButton: Bool = true
    @State private var title: String
    @State private var subTitle: String?
    
    init(showsBackButton: Bool, title: String, subTitle: String? = nil) {
        self.showsBackButton = showsBackButton
        self.title = title
        self.subTitle = subTitle
    }
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 5) {
            Spacer()
            titleSection
            Spacer()
        }
        .padding()
        .accentColor(.white)
        .foregroundStyle(.white)
        .font(.headline)
        .background(
            Color.blue.ignoresSafeArea(edges: .top)
        )
    }
}

extension CustomNavBarView {
    
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var titleSection: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
            AppPickerTextField(data: ["1", "2"], doneButtonTitle: "Done")
                .frame(width: 150, height: 50)
                .cornerRadius(25)
        }
    }
}

#Preview {
    CustomNavBarView(showsBackButton: false, title: "title")
}
