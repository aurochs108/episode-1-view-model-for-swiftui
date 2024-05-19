//
//  RoundedButtonView.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 19/05/2024.
//

import SwiftUI

struct RoundedButtonView<Label: View>: View {
    let label: () -> Label
    
    init(@ViewBuilder label: @escaping () -> Label) {
        self.label = label
    }

    var body: some View {
        label()
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}

#Preview {
    RoundedButtonView {
        Text("Button")
    }
}
