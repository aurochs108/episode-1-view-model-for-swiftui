//
//  SecretButtonView.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 07/04/2024.
//

import SwiftUI

struct SecretButtonView: View {
    private let onButtonTapped: () -> Void
    
    init(onButtonTapped: @escaping () -> Void) {
        self.onButtonTapped = onButtonTapped
    }
    
    var body: some View {
        Button {
            onButtonTapped()
        } label: {
            buttonView()
        }
    }
    
    @ViewBuilder
    private func buttonView() -> some View {
        ZStack {
            Rectangle()
                .fill(.red)
            Text("Reveal secret")
        }
    }
}

#Preview {
    SecretButtonView {
        print("Reveal tapped")
    }
}
